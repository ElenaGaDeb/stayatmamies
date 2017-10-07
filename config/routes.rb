Rails.application.routes.draw do

  resources :profiles, only: [:edit, :new, :show, :update, :create]

  resources :apartments, only: [:show, :index, :new, :create, :edit, :update]

  devise_for :users,
  controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :users do
    resources :reviews, only: [:index, :create]
  end

  root to: 'apartments#index'
  mount Attachinary::Engine => "/attachinary"

  get "test", to: "pages#test"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
