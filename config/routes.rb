Rails.application.routes.draw do
  root "home#index"

  #auth
  get "/auth/reddit", as: "reddit_login"
  get "/auth/reddit/callback", to: "sessions#create"

  #profile
  resource :profile, only: [:show]
  resources :posts, only: [:index]
  get "/post", to: "posts#show"
end
