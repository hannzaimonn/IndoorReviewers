Rails.application.routes.draw do
  devise_for :users
  resources :users,only: [:show,:index,:edit,:update]
  resources :reviews do
  	resources :bookmarks, only: [:create, :destroy]
  	resources :comments, only: [:create, :destroy]
  end
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :bookmarks, only: [:index]
  resources :genres,only: [:new,:create]
  resources :relationships, only: [:create, :destroy]
  root 'homes#top'
  get 'homes/about' => "homes#about"
  get 'search' => "searchs#search"
  get 'rank' => "reviews#rank"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
