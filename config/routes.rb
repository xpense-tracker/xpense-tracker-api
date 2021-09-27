# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :sessions, only: %i[create]
      resources :categories
      resources :transactions
      resources :users, only: %i[create]
      resource :my_profile, only: %i[show update]
    end
  end
end
