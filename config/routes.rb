Rails.application.routes.draw do
  resources :registrations

  resources :courses

  root "courses#index"
end
