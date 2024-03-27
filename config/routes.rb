Rails.application.routes.draw do
  root 'users#portfolio'
  resources :user_lawsuits
  get 'admin/home'
 
  devise_for :users, controllers: {
        sessions: 'users/sessions'
      }

  get 'users/remove', to: 'users#remove'



  resources :lawsuits
  resources :participants
  resources :ocs
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
