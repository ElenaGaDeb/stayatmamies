Rails.application.routes.draw do
  get 'reviews/index'

  get 'reviews/new'

  resources :apartments, only: [:show, :index, :new, :create, :edit, :update]
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
