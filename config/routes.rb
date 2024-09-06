# frozen_string_literal: true

Rails.application.routes.draw do
  # Devise routes for user authentication
  devise_for :users

  # Article routes
  resources :articles, only: %i[index show]

  # Defines the root path route ("/")
  root 'articles#index'

  # Admin routes
  get 'dashboard', to: 'dashboard#index', as: 'dashboard'
  resources :users, only: %i[index show edit update destroy]
  get 'settings', to: 'settings#new', as: 'settings'

  # Define the sign-in path
  # get 'sign_in', to: 'sessions#new', as: 'sign_in'
end
