# frozen_string_literal: true

Rails.application.routes.draw do
  resources :articles, only: %i[index show]

  # Defines the root path route ("/")
  root 'articles#index'

  # Define the sign-in path
  get 'sign_in', to: 'sessions#new', as: 'sign_in'
end
