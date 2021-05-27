Rails.application.routes.draw do
  devise_for :users,
    controllers: {
      confirmations: 'users/confirmations'
    }
    
  root to:'gym_apps#index'
  resources :gym_apps
  get "/lessons",to:"lessons#index"
  get "/lessons/:id",to:"lessons#show",as:"lesson"
  get "/items",to:"items#index"
  get "/items/:id",to:"items#show",as:"item"
  get "/points",to:"points#index"
  resources :reservations, only: [:index,:show, :create, :destroy]
    namespace :management do
        resources :lessons
        resources :items
        get "/authenticate",to:"session#new"
        post "/authenticate",to:"session#create"
        resources :users do
          member do
            post "points",to:"users#point"
          end
        end

        get "/logout",to:"session#destroy"
        
    end
    get "/login",to:"session#new"
end
