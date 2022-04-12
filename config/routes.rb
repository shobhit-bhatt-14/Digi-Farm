Rails.application.routes.draw do
  root to: "sessions#new"

  get "sign_up", to: "registrations#new"
  post "sign_up", to:"registrations#create"

  get "sign_in", to: "sessions#new"
  post "sign_in", to: "sessions#create"

  delete "sign_out", to:"sessions#destroy"

  resources :feeds do
    resources :comments
  end

  resources :notifications
  resources :messages

  resources :discussions do
    resources :answers
    resources :regions
  end

  get "infohub", to: "infohubs#show"
  post "infohub", to: "infohubs#create"

  resources :profiles
end
