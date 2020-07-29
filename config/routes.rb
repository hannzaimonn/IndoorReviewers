Rails.application.routes.draw do
  resources :users,only: [:show,:index,:edit,:update]
  resources :reviews
  root 'homes#top'
  get 'homes/about' => "homes#about"
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
