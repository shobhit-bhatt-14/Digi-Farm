Rails.application.routes.draw do
  resources :discussions do
    resources :answers
    resources :regions
  end

  resources :feeds
end
