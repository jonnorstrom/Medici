Rails.application.routes.draw do
  devise_for :users, class_name: 'FormUser', :controllers => { omniauth_callbacks: 'omniauth_callbacks', registrations: 'registrations'}


  get "carts/clear" => "carts#clear", as: :clear_cart
  resources :carts, only: [:show]
  get "museums/:id/tagging" => "museums#tagging_new"
  post "museums/:id/tagging" => "museums#tagging_create"
  resources :museums
  get "tickets/stats" => "tickets#stats"
  get "tickets/thanks" => "tickets#thanks"
  get "tickets/whoops" => "tickets#whoops"
  get "tickets/redeem/:id" => "tickets#redeem", as: :tickets_redeem
  resources :tickets
  get "exhibits/:id/tagging" => "exhibits#tagging_new"
  post "exhibits/:id/tagging" => "exhibits#tagging_create"
  get "exhibits/search_new" => "exhibits#search_new"
  get "exhibits/search_show" => "exhibits#search_show"
  resources :exhibits
  get "pieces/:id/tagging" => "pieces#tagging_new"
  post "pieces/:id/tagging" => "pieces#tagging_create"
  resources :pieces
  get "events/:id/tagging" => "events#tagging_new"
  post "events/:id/tagging" => "events#tagging_create"
  resources :events
  get "charges/redemption" => "charges#redemption"
  resources :charges
  get "users/:id/personalized" => "users#personalized"
  get "users/:id/tagging" => "users#tagging_new"
  post "users/:id/tagging" => "users#tagging_create"
  resources :users, only: [:show]
  resources :taggings
  resources :tags, only: [:show, :new, :create]
  get "terms/terms" => "terms#terms"
  get "terms/privacy" => "terms#privacy"
  get "terms/about" => "terms#about"

  resources :coupons
  root to: "museums#index"
end
