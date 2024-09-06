# frozen_string_literal: true

Rails.application.routes.draw do
  resources :articles, only: %i[index show]

  # Defines the root path route ("/")
  # root "posts#index"
end
