Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"

# tipo metodo, to el nombre del conrolador,
# metodos por convencion de rails
# varias cosas es index 
# show muestra un unico valor
# create agragar uno nuevo
# update actializar
# destroy eliminar

#  delete 'products/:id', to: 'products#destroy'
#  patch '/products/:id', to: 'products#update'
#  post '/products', to: 'products#create'
#  get '/products/new', to: 'products#new', as: :new_product
#  get '/products', to: 'products#index'
#  get '/products/:id', to: 'products#show', as: :product
#  get '/products/:id/edit', to: 'products#edit', as: :edit_product

# resources hace lo mismo que la linea 14-20 en una sola linea
resources :products, path: '/'

end
