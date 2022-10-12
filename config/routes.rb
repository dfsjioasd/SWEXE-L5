Rails.application.routes.draw do
  root 'tweets#main'
  post 'users/login'
  resources :tweets
  resources :users
  resources :like
  get 'get_image/:id', to: 'tweets#get_image'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
