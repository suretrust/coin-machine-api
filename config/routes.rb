# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      get 'coins_total_value', to: 'coins_total_value#index'

      resources :api_users, only: :create
      resources :coins
      resources :transactions, only: %i[index create]
    end
  end
end
