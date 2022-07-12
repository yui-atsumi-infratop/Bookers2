Rails.application.routes.draw do

  devise_for :users
  resources :users, only: [:show, :edit, :index, :update]

  root to: "homes#top"
  get'homes/about'=>'homes#about',as: 'home/about'

  resources :books

end