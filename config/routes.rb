Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations', sessions: 'sessions' }

  root 'site#index'
  resources :users, only: [:show, :edit, :update]

  authenticated :user, ->(u) { u.is_admin? } do
      root to: 'admin/dashboard#index'
      ActiveAdmin.routes(self)
  end
end
