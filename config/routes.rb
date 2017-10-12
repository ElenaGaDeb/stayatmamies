Rails.application.routes.draw do
  resources :conversations do
    resources :messages, only: [:create]
  end

  ActiveAdmin.routes(self)
  resources :profiles, only: [:edit, :new, :show, :update, :create] do
    resources :reviews, only: [:create]
  end
  resources :profiles, only: [:edit, :new, :show, :update, :create]

  resources :apartments do
    resources :bookings, only: [:create, :new, :show, :update]
  end

  devise_for :users,
  controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'apartments#index'
  mount Attachinary::Engine => "/attachinary"

  get "test", to: "pages#test"

  mount ActionCable.server, at: '/cable'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
