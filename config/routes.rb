ProFootballApi::Application.routes.draw do

  root to: "home#index"

  scope path: "/api/v1" do
	  resources :teams, only: [:index, :show],
	  									 via: :get,
							 constraints: { id: /[0-9]+/ }
		end
end
