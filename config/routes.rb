Rails.application.routes.draw do
  resources :hosts, only: :index

  root 'hosts#index'
end
