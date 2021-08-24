# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :sessions, only: %i[create]
      resources :users, only: %i[show create update]
      resource :my_profile, only: %i[show]
    end
  end
end
