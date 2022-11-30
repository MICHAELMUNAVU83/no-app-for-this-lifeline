# frozen_string_literal: true

Rails.application.routes.draw do
  resources :patients do
    resources :pre_existing_conditions
    resources :food_allergies
    resources :drug_allergies
  end
  devise_for :doctors
  root to: "doctors#index"

  devise_scope :doctor do
    get '/doctors/sign_out' => 'devise/sessions#destroy'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
