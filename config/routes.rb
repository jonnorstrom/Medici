Rails.application.routes.draw do
  devise_for :users

  resources :carts, only: [:show]
  resources :museums
  get "tickets/redeem/:id" => "tickets#redeem"
  resources :tickets
  resources :exhibits
  resources :charges
  resources :users, only: [:show, :edit, :update]

  root to: "museums#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
