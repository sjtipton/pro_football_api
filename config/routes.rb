ProFootballApi::Application.routes.draw do

  root to: "home#index"

  resources :teams, only: [:index, :show], via: :get, constraints: { id: /[0-9]+/ }
end
