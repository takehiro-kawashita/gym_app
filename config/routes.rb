Rails.application.routes.draw do
  devise_for :users
  resources :gym_apps
  root 'gym_apps#index'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    namespace :management do
        get "/login",to:"session#new"
        get "/lessons",to:"lessons#index"
        get "/lessons/:id",to:"lessons#show",as:"lesson"
    end
    
    get "/login",to:"session#new"
    
end
