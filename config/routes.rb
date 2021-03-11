Rails.application.routes.draw do

  devise_for :users
  
  root to:'gym_apps#index'
  resources :gym_apps
  namespace :gym_apps do
    resources :items
    resources :lessons
  end
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
