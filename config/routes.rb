Rails.application.routes.draw do
  devise_for :users

  resources :carts, only: [:show]
  get "museums/:id/tagging" => "museums#tagging_new"
  post "museums/:id/tagging" => "museums#tagging_create"
  resources :museums
  get "tickets/stats" => "tickets#stats"
  get "tickets/redeem/:id" => "tickets#redeem"
  resources :tickets
  get "exhibits/:id/tagging" => "exhibits#tagging_new"
  post "exhibits/:id/tagging" => "exhibits#tagging_create"
  resources :exhibits
  resources :charges
  get "users/:id/tagging" => "users#tagging_new"
  post "users/:id/tagging" => "users#tagging_create"
  resources :users, only: [:show, :edit, :update]
  resources :taggings

  root to: "museums#index"
end
