Rails.application.routes.draw do
  get 'product_image/index'
  get 'product_image/new'
  get 'product_image/create'
  get 'product_image/destroy'
  get 'user/list'
  get 'user/new'
  post 'user/create'
  post 'user/update'
  get 'user/show'
  get 'user/edit'
  get 'user/delete'
  get 'user/update'
  
  get 'authentication/sign'
  post 'authentication/signin'
  get 'authentication/dashboard'
  get 'authentication/signout'

  get '', to: 'product#list'
  get 'new', to: 'product#new'
  get 'show', to: 'product#show'
  get 'delete', to: 'product#delete'
  get 'product/list'
  get 'product/new'
  get 'product/show'
  post 'product/create'
  post 'product/update'
  get 'product/show'
  get 'product/edit'
  get 'product/delete'
  get 'product/update'

  post 'sale/cart'
  get 'sale', to: 'sale#sale'
  get 'sale/sale'
  get 'sale/pay'

  get 'access_level/list'
  get 'access_level/new'
  post 'access_level/create'
  patch 'access_level/update'
  get 'access_level/show'
  get 'access_level/edit'
  get 'access_level/delete'
  get 'access_level/update'

  get 'access_level_action/list'
  get 'access_level_action/new'
  post 'access_level_action/create'
  patch 'access_level_action/update'
  get 'access_level_action/show'
  get 'access_level_action/edit'
  get 'access_level_action/delete'
  get 'access_level_action/update'


  resources :product_image, only: [:index, :new, :create, :destroy]   
   root "product_image#index" 
  get 'product_image/', to: 'product_image#index'
  get 'product_image/new', to: 'product_image#new'
  post 'product_image/new', to: 'product_image#create'
  get 'product_image/delete', to: 'product_image#destroy'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
