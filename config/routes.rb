Rails.application.routes.draw do
  # Devise routes for admin authentication
  devise_for :admin_users

  # Public routes
  root "home#index"

  resources :projects, only: [ :index, :show ]
  get "about", to: "about#index"
  resources :contacts, only: [ :new, :create ]

  # Admin namespace - requires authentication
  namespace :admin do
    root to: "dashboard#index"

    resource :artist, only: [ :edit, :update ]
    resources :projects
    resources :artworks
    resources :contact_inquiries, only: [ :index, :show ]
  end

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
end
