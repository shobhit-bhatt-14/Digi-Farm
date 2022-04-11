Rails.application.routes.draw do
  root to: "welcomes#index"

  post "/", to: "welcomes#check"
  get "sign_up", to: "welcomes#new"
  post "sign_up", to:"welcomes#create"

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
