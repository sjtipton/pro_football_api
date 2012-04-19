ProFootballApi::Application.routes.draw do

  devise_for :users do
    get "sign_in", to: "devise/sessions#new", as: :sign_in
    get "sign_out", to: "devise/sessions#destroy", as: :sign_out
  end

  root to: "home#index"

  scope path: "/api/v1", defaults: { format: :json }, constraints: { id: /[0-9]+/ } do
    resources :teams, only: [:index, :show]

    resources :games, only: [:index, :show]

    get "/teams/:id/games" => "team_games#index", as: :team_games
    get "/schedule" => "games#index", as: :complete_schedule
    get "/teams/:id/schedule" => "team_games#index", as: :team_schedule
  end
end
