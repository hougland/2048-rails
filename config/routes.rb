Rails.application.routes.draw do

  root "site#index"
  get "/auth/:provider/callback", to: "sessions#create"
  delete "/logout", to: 'sessions#destroy', as: :logout
  resources :users, :except => [:new, :create]
end
