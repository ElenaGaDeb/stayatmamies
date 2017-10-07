Rails.application.routes.draw do

  get 'conversations/index'

  get 'conversations/new'

  get 'conversations/create'

  get 'conversations/show'

  get 'conversations/close'

  get 'messages/new'

  get 'messages/create'

  get 'messages/index'

  get 'messages/show'

  get 'messages/delete'

  resources :profiles, only: [:edit, :new, :show, :update, :create]

  resources :apartments, only: [:show, :index, :new, :create, :edit, :update]


  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'apartments#index'

  get "test", to: "pages#test"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
