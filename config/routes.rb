Rails.application.routes.draw do
  devise_for :users
  root to: 'books#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books, only:[:index, :create, :show, :edit, :update, :destroy]


  # root 'book_images#index'

  resources :users, only: [:show, :index, :edit, :update]

  get 'about' => 'users#about'
end