Rails.application.routes.draw do
  resources :first_people
  resources :mains
  resources :learned_lists
  resources :what_to_dos
  resources :points
  resources :to_dos
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  # get "up" => "rails/health#show", as: :rails_health_check

  post "send", to: "mains#send_mail"

  get "redirect", to: "mains#redirect"
  post "set-akashi-alert", to: "mains#set_akashi_alert"

  # Defines the root path route ("/")
  root "mains#new"
end
