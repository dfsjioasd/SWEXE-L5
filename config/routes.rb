Rails.application.routes.draw do
  get 'tweets/index'
  root 'tweets#index'
  get 'tweets/new', to: 'tweets#new'
  post 'tweets', to: 'tweets#create'
  delete 'tweets/:id', to: 'tweets#destroy'
  get 'tweets/:id', to: 'tweets#show'
  get 'tweets/edit/:id', to: 'tweets#edit'
  patch 'tweets/:id', to: 'tweets#update'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
