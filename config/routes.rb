Rails.application.routes.draw do
  devise_for :users

  root "home#index"


  resources :donations, only: [ :new, :create ]
  get "search_donors", to: "donations#search", as: "search_donors"
  resources :blood_requests, only: [ :new, :create, :index, :update ]
  patch "blood_requests/:id/accept", to: "blood_requests#accept", as: "accept_blood_request"

  resources :blood_requests do
    member do
      get :accept
      post :send_details
    end
  end

  resources :donors, only: [] do
    member do
      get :send_request_form
      post :send_request
    end
  end



  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
