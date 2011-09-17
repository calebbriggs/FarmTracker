FarmTracker::Application.routes.draw do
  get "/login" => "application#login", :as => :login_form
  post "/login" => "application#login", :as => :login
  get "/logout" => "application#logout", :as => :logout
  resources :herds

  resources :animals

  resources :farms

  resources :users
  match "/users" => "users#index" , :as =>  :users
  match "/users/new" => "users#new", :as => :new_user
  root :to => "home#index", :as => 'home'


end
