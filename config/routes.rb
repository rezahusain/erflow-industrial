Rails.application.routes.draw do
  resources :comments
  resources :patient_requests
  resources :home
  devise_for :users
  root to: "home#home", as: 'landing_page'

  get "comments/:id/new" => "comments#new", as: :new_comment_on_request

  # This is a blank app! Pick your first screen, build out the RCAV, and go from there. E.g.:

  # get "/your_first_screen" => "pages#first"
  
end
