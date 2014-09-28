Rails.application.routes.draw do
  resources :registrations

  post "/hook" => "regstrations#hook"

  resources :courses

  root "courses#index"
end
