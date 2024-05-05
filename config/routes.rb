# frozen_string_literal: true

Rails.application.routes.draw do
  scope module: :web do
    post 'auth/:provider', to: 'auth#request', as: :auth_request
    get 'auth/:provider/callback', to: 'auth#callback', as: :callback_auth
    delete 'auth', to: 'auth#destroy', as: :auth_destroy

    root 'bulletins#index'
    namespace :admin do
      root 'admin#index'
      resources :categories, except: %i[show]
      resources :bulletins, only: %i[index]
    end
    resources :bulletins
  end
end
