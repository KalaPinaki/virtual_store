require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
    test 'render a list of products' do 
        get products_path

        assert_response :success
        assert_select '.product', 2
    end

    test 'render a detailed product page' do 
        get product_path(products(:ps4))

        assert_response :success
        assert_select '.title', 'Ps4 Fat'
        assert_select '.description', 'PS4 en buen estado'
        assert_select '.price', '$ 150'
    end

    test 'render a new product form' do
        get new_product_path

        assert_response :success
        assert_select 'form'
    end

    test 'allow to create a new product' do
        post products_path, params: {
            product:{
                title:'Nintendo 64',
                description:'Le falta los cables',
                price: 45
            }
        }

        assert_redirected_to products_path
        assert_equal flash[:notice], 'Product created successfully!'
    end

    test 'does not allow to create a new product with empty fields' do
        post products_path, params: {
            product:{
                title:'',
                description:'Le falta los cables',
                price: 45
            }
        }
    
        assert_response :unprocessable_entity
    end

    test 'render an edit product form' do
        get edit_product_path(products(:switch))

        assert_response :success
        assert_select 'form'
    end

    test 'allow to update a product' do
        patch product_path(products(:switch)), params: {
            product:{
                price: 45
            }
        }

        assert_redirected_to products_path
        assert_equal flash[:notice], 'Product updated successfully!'
    end

    test 'Does not allow to update a product with an invalid fields' do
        patch product_path(products(:switch)), params: {
            product:{
                price: nil
            }
        }

        assert_response :unprocessable_entity
    end

    test 'can delete products' do
        assert_difference('Product.count', -1) do
            delete product_path(products(:switch))
        end

        assert_redirected_to products_path
        assert_equal flash[:notice], 'Product deleted successfully!'
    end

end