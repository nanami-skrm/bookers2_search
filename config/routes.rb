Rails.application.routes.draw do
  root :to => 'home#top'
  get 'home/about' => 'home#about'
  devise_for :users
  resources :users, only: [:show,:index,:edit,:update]
  resources :books
  resources :search, only: [:search]
  get "search" => "search#search"

end
