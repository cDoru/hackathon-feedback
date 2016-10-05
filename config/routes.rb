Rails.application.routes.draw do
  post 'feedback_request/create'

  get 'goal/index'

  get 'feedback_request/new'

  post 'goal/create'

  get 'goal/new'

  get 'feedback/new'

  post 'feedback/create'

  get 'feedback/show'

  get 'feedback/:id', to: 'feedback#show', as: 'feedback'

  get 'users/search'

  get 'users/show_feedback'

  get 'users/:id', to: 'users#show', as: 'user'

  get 'dashboard/index'

  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

  root to: 'welcome#index'
end
