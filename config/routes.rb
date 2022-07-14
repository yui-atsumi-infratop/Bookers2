Rails.application.routes.draw do

  devise_for :users
  resources :users, only: [:show, :edit, :index, :update]

  root to: "homes#top"
  get'home/about'=>'homes#about',as: 'home/about'

  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end

end
