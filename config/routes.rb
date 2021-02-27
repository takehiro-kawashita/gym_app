Rails.application.routes.draw do
  devise_for :users
  resources :gym_apps
  root 'lessons#index'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    namespace :management do
        get "/login",to:"session#new"
        get "/lessons",to:"lessons#index"
        post "/lessons/new",to:"lessons#create"
        get "/lessons/new",to:"lessons#new",as:"new_lesson"
        get "/lessons/:id",to:"lessons#show",as:"lesson"
        get "/lessons/:id/edit",to:"lessons#edit",as:"edit_lesson"
        patch "/lessons/:id/edit",to:"lessons#update"
        # resources :lessons
    end
    
    get "/login",to:"session#new"
    
end
