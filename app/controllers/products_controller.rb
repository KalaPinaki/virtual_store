# hereda de application controller por que el ya tiene todo lo que necesita aplicar para los controles
class ProductsController < ApplicationController
    # def sirve para definir metodos
    def index
        @products = Product.all.with_attached_photo
    end

    def show
        product
    end

    def new 
        @product = Product.new
    end

    def create
        @product = Product.new(product_params)
        # para comentar
    #   pp @product
        if @product.save 
            redirect_to products_path, notice: t('.created')
        else
            # status 422 cuando no guardo
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        product
    end

    def update
        if product.update(product_params) 
            redirect_to products_path, notice: t('.updated')
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        product.destroy

        #status see_other 303 producto que no existe, redirect a otro producto
        redirect_to products_path, notice: t('.destroyed'), status: :see_other

    end

    private 
    def product_params
        params.require(:product).permit(:title, :description, :price, :photo)
    end

    def product
        @product = Product.find(params[:id])
    end

end