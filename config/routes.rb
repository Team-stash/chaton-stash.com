Rails.application.routes.draw do

  
  namespace :admin do
    get 'dashboard', to: 'dashboard#index'
    resources :users
    resources :items
  end

  
  resource :session, only: %i[new create destroy]
  resource :registration, only: %i[new create]
  resources :users
  resources :items, only: [:index, :show]
  resources :passwords, param: :token
  
  resources :pages

  resource :cart, only: [:show, :update, :destroy] do
    post 'add_item/:item_id', to: 'carts#add_item', as: 'add_item'
  end

  scope '/checkout' do
    post 'create', to: 'checkout#create', as: 'checkout_create'
    get 'success', to: 'checkout#success', as: 'checkout_success'
    get 'cancel', to: 'checkout#cancel', as: 'checkout_cancel'
  end


  post 'create_order', to: 'orders#create', as: 'create_order'
  
  resources :orders, only: [:index, :create, :show]
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

# Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
# Can be used by load balancers and uptime monitors to verify that the app is live.
get "up" => "rails/health#show", as: :rails_health_check

# Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
# get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
# get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

# Defines the root path route ("/")

root "home#index"

end
