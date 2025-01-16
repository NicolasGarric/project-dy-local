Rails.application.routes.draw do
  get "contact", to: "contact#index"
  get 'home/index'
  root "home#index"

  get "up" => "rails/health#show", as: :rails_health_check

  resources :contact_requests, only: [:new, :create]

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
