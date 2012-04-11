ProFootballApi::Application.routes.draw do

  root to: "home#index"

  scope path: "/api/v1" do
	  resources :teams, only: [:index, :show],
									defaults: { format: :json },
							 constraints: { id: /[0-9]+/ }
		end
end
