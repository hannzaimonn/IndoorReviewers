Rails.application.routes.draw do
  get 'users/index'
  get 'users/show'
  get 'users/edit'
  resources :reviews
  root 'homes#top'
  get 'homes/about' => "homes#about"
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
