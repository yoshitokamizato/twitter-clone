Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    authenticated :user do
      root :to => 'tweets#index', as: :authenticated_root
    end
    unauthenticated :user do
      root :to => 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  # resources :tweets do
  #   resources :replies, except: [:index]
  # end
  get 'users/index' => 'users#index', as: :users
  get 'users/:id/show' => 'users#show', as: :user
  get 'users/:user_id/follows' => 'follows#index', as: :user_follows
  post 'users/:user_id/follows/create' => 'follows#create', as: :follow_create
  delete 'users/:user_id/follows/destroy' => 'follows#destroy', as: :follow_destroy
  post 'tweets/create' => 'tweets#create', as: :tweet_create
  delete 'tweets/:tweet_id/destroy' => 'tweets#destroy', as: :tweet_destroy
  get 'users/:user_id/likes' => 'likes#index', as: :user_likes
  post 'likes/:tweet_id/create' => 'likes#create', as: :like_create
  delete 'likes/:tweet_id/destroy' => 'likes#destroy', as: :like_destroy

  # get 'tweets/index' => 'tweets#index'
  # post 'tweets/create' => 'tweets#create'
  # delete 'tweets/destroy' => 'tweets#destroy'
  # post 'likes/create' => 'likes#create'
  # delete 'likes/destroy' => 'likes#destroy'

  get 'tests/index' => 'tests#index'

end