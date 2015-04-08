Rails.application.routes.draw do
  root 'hosts#index'

  resources :hosts, only: :index
  resources :jobs, only: [:index, :show, :new, :create]
  resources :credentials, only: :index
end
