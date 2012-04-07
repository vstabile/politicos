Politizado::Application.routes.draw do
  resources :orgaos

  resources :partidos

  devise_for :politicos
  
  resources :politicos

  devise_for :users

  resources :users 
  
  root :to => 'home#index'
end
