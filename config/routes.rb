FarmTracker::Application.routes.draw do
  resources :farms

  resources :users
   match "/users" => "users#index" , :as =>  :users
  root :to => "home#index", :as => 'home'


end
