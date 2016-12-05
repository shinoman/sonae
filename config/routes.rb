Rails.application.routes.draw do
  resources :places
  post 'place/searches' => 'places#search'
  get 'map/index'
  resources :images, only: [:edit, :update, :destroy] do
    collection do
      post :upload
    end
  end
  devise_for :users, controllers: { :omniauth_callbacks => 'omniauth_callbacks'}
  root 'pages#index'
  get 'pages/show'
  get 'users/:id' => 'users#show', :as => 'users'
  get 'post', to: 'users#post'
  resources :microposts do
    resource :favorite_microposts, only: [:create, :destroy]
	end
  get 'hashtag' => 'pages#tag', :as => 'tag'

  resources :relationships, only: [:create, :destroy]
  resources :users, only: [:get] do
    member do
      get 'favorite_microposts'
      get 'followings'
      get 'followers'
      get 'microposts_post'
      get 'relation_micropost_post'
      get 'favorited_post'
    end
  end
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
end
