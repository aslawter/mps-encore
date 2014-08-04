require "monban/constraints/signed_in"
require "monban/constraints/signed_out"

Rails.application.routes.draw do
  constraints Monban::Constraints::SignedIn.new do
    resource :session, only: [:destroy]

    root "dashboards#show", as: :dashboard
  end

  resource :session, only: [:new, :create]
  resources :users, only: [:new, :create] do
    resource :pending_users, only: [:show]
  end

  root to: "sessions#new"
  get "/sign_up", to: "users#new"
  get "/sign_in", to: "sessions#new"
end
