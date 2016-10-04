Rails.application.routes.draw do
  post 'feedback_request/create'

  get 'goal/index'

  get 'feedback_request/new'

  post 'goal/create'

  get 'feedback/new'

  post 'feedback/create'

  get 'feedback/show'

  get 'feedback/:id', to: 'feedback#show', as: 'feedback'

  get 'goal/new'

  get 'users/search'

  get 'users/:id', to: 'users#show', as: 'user'

  get 'dashboard/index'

  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

  root to: 'welcome#index'

  get 'home/index', to: 'home#index'
end
