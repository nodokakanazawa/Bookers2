Rails.application.routes.draw do

  devise_for :users
  root :to => 'homes#top'
  get 'home/about' => 'homes#about',as:'about'
  resources :books, only: [:create, :index, :show, :update, :edit ,:destroy ]do
    resources :book_comments, only: [:create,:destroy]
    resource :favorites, only:[:create,:destroy]
  end
  post '/books' => 'favorites#create'
  delete '/books' => 'favorites#destroy'
  resources :users, only: [:show, :edit, :index, :update]
end

