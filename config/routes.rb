Rails.application.routes.draw do
  resources :comments
  resources :patient_requests
  devise_for :users
  root to: "patient_requests#index"

  # This is a blank app! Pick your first screen, build out the RCAV, and go from there. E.g.:

  # get "/your_first_screen" => "pages#first"
  
end
