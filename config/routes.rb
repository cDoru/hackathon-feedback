Rails.application.routes.draw do
  post 'feedback_request/create'

  get 'feedback_request/new'

  get 'feedback_request/:id', to: 'request#show', as: 'feedback_request'

  get 'feedback/new'

  post 'feedback/create'

  get 'feedback/show'

  get 'users/search'

  get 'users/:id', to: 'users#show', as: 'user'

  get 'dashboard/index'

  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

  root to: 'welcome#index'

  get 'home/index', to: 'home#index'
end
