ProFootballApi::Application.routes.draw do

  devise_for :users do
  	get "sign_in", to: "devise/sessions#new", as: :sign_in
    get "sign_out", to: "devise/sessions#destroy", as: :sign_out
  end

  root to: "home#index"

  scope path: "/api/v1" do
	  resources :teams, only: [:index, :show],
									defaults: { format: :json },
							 constraints: { id: /[0-9]+/ }
		end
end
