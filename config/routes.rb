Rails.application.routes.draw do
  resources :widgets
  devise_for :users, :path => '', :path_names => {:sign_in => 'login', :sign_out => 'logout'}
  resources :users
  resources :products do
    resources :comments
  end

  resources :orders, only: [:index, :show, :create, :destroy]

  get 'static_pages/about'

  get 'static_pages/contact'

  get 'static_pages/index'

  get 'static_pages/landing_page'

  post 'static_pages/thank_you'

post 'payments/create'
get 'payments/create'


mount ActionCable.server => '/cable'


  # commented out above line and put in below line cf 3.8 and put back in 5.1
  root 'static_pages#landing_page'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
