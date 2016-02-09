Rails.application.routes.draw do

  root "site#index"
  get "/auth/:provider/callback", to: "sessions#create"
  delete "/logout", to: 'sessions#destroy', as: :logout

  # api endpoints
  get 'games/:id' => 'games#load_game', as: :load_game
  post 'games/:id' => 'games#save_game', as: :save_game
  get 'users/leaderboard' => 'users#leaderboard', as: :leaderboard

  resources :users, :except => [:new, :create, :edit, :update]

end
