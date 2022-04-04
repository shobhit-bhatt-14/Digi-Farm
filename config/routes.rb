Rails.application.routes.draw do
  get 'infohub/index'
  root to: redirect("/feeds")

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
