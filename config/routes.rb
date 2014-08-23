require "monban/constraints/signed_in"

Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :destroy] do
    resource :activation_approvals, only: [:create]
    resource :pending_users, only: [:show]
  end

  resources :solicitations, only: [:new, :create, :index, :show] do
    resources :attachments, only: [:new, :create, :show]
  end

  resources :contacts, only: [:index, :show]
  resources :customers, only: [:new, :create, :show, :index] do
    resources :contacts, only: [:new, :create]
    resources :performances, only: [:new, :create, :update]
  end

  resources :performances, only: [:show, :edit, :index] do
    resources :performance_contacts, only: [:new, :create, :edit, :update]
    resources :opportunities, only: [:new, :create]
    resource :performance_download, only: [:create]
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
