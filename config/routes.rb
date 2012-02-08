# -*- encoding : utf-8 -*-
MusicOnVideo::Application.routes.draw do

  root :to => 'home#index'

  match '/auth/:provider/callback', to: 'sessions#create'
  match '/logout', to: 'sessions#destroy'

  resources :users
end
