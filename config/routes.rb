Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :users,only: [:show,:index,:edit,:update]
  resources :reviews do
  	resources :comments, only: [:create, :destroy]
  end
  resources :users do
    member do
      get :following, :followers, :review, :bookmark
    end
  end
  resources :genres,only: [:new,:create,:destroy]
  resources :relationships, only: [:create, :destroy]
  root 'homes#top'
  get 'homes/about' => "homes#about"
  get 'rank' => "reviews#rank"

  post   '/bookmark/:review_id' => 'bookmarks#like',   as: 'like'
  delete '/bookmark/:review_id' => 'bookmarks#unlike', as: 'unlike'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
