require "monban/constraints/signed_in"

Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :destroy] do
    resource :activation_approvals, only: [:create]
    resource :pending_users, only: [:show]
  end

  resources :solicitations, only: [:new, :create]
  resources :contacts, only: [:index, :show]
  resources :customers, only: [:new, :create, :show, :index] do
    resources :contacts, only: [:new, :create]
    resources :performances, only: [:new, :create, :update]
  end

  resources :performances, only: [:show, :edit] do
    resources :performance_contacts, only: [:new, :create]
  end

  resources :partners, only: [:create, :index, :show] do
    resources :contacts, only: [:new, :create]
  end

  constraints Monban::Constraints::SignedIn.new do
    root "dashboards#show", as: :dashboard
  end

  root to: "sessions#new"
  get "/sign_up", to: "users#new"
  get "/sign_in", to: "sessions#new"
end
