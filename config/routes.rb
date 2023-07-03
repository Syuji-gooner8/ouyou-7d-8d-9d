Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   devise_for :users
   resources :users, only: [:show,:edit,:update] do
   resource :relationships, only: [:create, :destroy]
   get 'followings' => 'relationships#followings', as: 'followings'
   get 'followers' => 'relationships#followers', as: 'followers'
   end
   resources :books do
   resources :favorites, only: [:create, :destroy]
   resources:book_comments,only:[:create,:destroy]
   end

  root to: "homes#top"
  get "home/about"=>"homes#about",as: "about"
  get 'users' => 'users#index'
  delete '/books' => 'books#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
 end
