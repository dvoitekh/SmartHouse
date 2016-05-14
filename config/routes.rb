Rails.application.routes.draw do
  devise_for :users

  root 'site#index'
  resources :users
  authenticated :user do
     root to: 'admin/dashboard#index'
     ActiveAdmin.routes(self)
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
