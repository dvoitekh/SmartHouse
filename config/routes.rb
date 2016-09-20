Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations', sessions: 'sessions' }

  unauthenticated do
    root 'site#index'
  end

  authenticated :user do
    root 'users#show'
    resources :users, only: [:show, :edit, :update] do
      resources :devices
    end

    authenticated :user, ->(u) { u.is_admin? } do
      root to: 'admin/dashboard#index'
      ActiveAdmin.routes(self)
    end
  end
end
