Rails.application.routes.draw do

  devise_for :users
  
  root to:'gym_apps#index'
  resources :gym_apps
  
  get "/lessons",to:"lessons#index"
  get "/lessons/:id",to:"lessons#show",as:"lesson"
  get "/items",to:"items#index"
  get "/items/:id",to:"items#show",as:"item"
  get "/points",to:"points#index"
  resources :reservations, only: [:index, :create, :destroy]
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    namespace :management do

        # get "/login",to:"session#new"
        # get "/lessons",to:"lessons#index"
        # post "/lessons/new",to:"lessons#create"
        # get "/lessons/new",to:"lessons#new",as:"new_lesson"
        # get "/lessons/:id",to:"lessons#show",as:"lesson"
        # get "/lessons/:id/edit",to:"lessons#edit",as:"edit_lesson"
        # patch "/lessons/:id/edit",to:"lessons#update"
        resources :lessons
        resources :items
        get "/authenticate",to:"session#new"
        post "/authenticate",to:"session#create"
        resources :users
        get "/logout",to:"session#destroy"
    end
    
    get "/login",to:"session#new"
    
end
