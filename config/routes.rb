Rails.application.routes.draw do
  resources :feeds
  resources :notifications
  resources :messages

  resources :discussions do
    resources :answers
    resources :regions
  end

  resources :infohubs
  resources :profiles
end
