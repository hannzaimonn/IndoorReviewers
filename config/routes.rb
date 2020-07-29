Rails.application.routes.draw do
	devise_for :users
  resources :users,only: [:show,:index,:edit,:update]
  resources :reviews
  resources :genres,only: [:new,:create]
  root 'homes#top'
  get 'homes/about' => "homes#about"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
