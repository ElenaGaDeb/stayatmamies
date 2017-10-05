Rails.application.routes.draw do
  get 'apartments/index'

  get 'apartments/show'

  get 'apartments/new'

  post 'apartments/new'

  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
