# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :doctors
  devise_scope :doctor do
    authenticated :doctor do
      root 'doctors#index', as: :authenticated_root
    end
    unauthenticated do
      root 'doctors#splash', as: :unauthenticated_root
    end
  end

  resources :patients do
    resources :pre_existing_conditions
    resources :food_allergies
    resources :drug_allergies
  end

  devise_scope :doctor do
    get '/doctors/sign_out' => 'devise/sessions#destroy'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
