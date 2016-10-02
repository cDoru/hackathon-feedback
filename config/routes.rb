Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  root to: 'welcome#index'

  get 'home/index', to: 'home#index'
end
