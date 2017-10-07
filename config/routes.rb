Rails.application.routes.draw do
  resources :profiles, only: [:edit, :new, :show, :update, :create]

  resources :apartments do
    resources :apartment_amenities , only: [ :create ]
  end

  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'apartments#index'

  get "test", to: "pages#test"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
