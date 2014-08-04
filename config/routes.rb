require "monban/constraints/signed_in"

Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :destroy] do
    resource :activation_approvals, only: [:create]
    resource :pending_users, only: [:show]
  end

  resources :customers, only: [:new, :create, :index]

  constraints Monban::Constraints::SignedIn.new do
    root "dashboards#show", as: :dashboard
  end

  root to: "sessions#new"
  get "/sign_up", to: "users#new"
  get "/sign_in", to: "sessions#new"
end
