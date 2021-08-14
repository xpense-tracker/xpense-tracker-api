# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :sessions, only: %i[create]
      resource :users, only: %i[show create update]
    end
  end
end
