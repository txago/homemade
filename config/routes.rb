Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :products do
    resources :orders, only: [:create]
  end


  resources :orders, only: [:index, :update, :destroy]
  get '/my_products', to: "products#my_products"
  post 'checkout', to: 'orders#purchase', as: 'purchase'
  get 'confirmation', to: 'orders#confirmation'
end
