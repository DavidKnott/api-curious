Rails.application.routes.draw do
  root 'home#index'
  get "/auth/reddit/callback", to: "sessions#create"
end
