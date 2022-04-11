Rails.application.routes.draw do
  root to: "main#index"

  get "sign_up", to: "registrations#new"
  post "sign_up", to:"registrations#create"

  resources :feeds do
    resources :comments
  end

  resources :notifications
  resources :messages

  resources :discussions do
    resources :answers
    resources :regions
  end

  resource :infohub
  resources :profiles
end
