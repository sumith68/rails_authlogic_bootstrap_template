Rails.application.routes.draw do

  resources :user_sessions

  get 'login' => "user_sessions#new",    as: :login
  delete 'logout' => "user_sessions#destroy", as: :logout

  resources :users  # give us our some normal resource routes for users
  #resource :user, as: 'account'  # a convenience route

  # match 'signup' => 'users#new', :as => :signup,  via: [:get, :post]
  root  "user_sessions#new"
end
