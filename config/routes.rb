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

  # get 'users' => 'users#index'
  # get 'users/:id/show' => 'users#show', as: :user
  # get 'users/:user_id/user_follow_relations' => 'user_follow_relations#index'
  # post 'users/:user_id/user_follow_relations/create' => 'user_follow_relations#create'
  # delete 'users/:user_id/user_follow_relations/:id/destroy' => 'user_follow_relations#destroy'
  # get 'users/:user_id/tweets' => 'tweets#index'
  # post 'users/:user_id/tweets/create' => 'tweets#create'
  # delete 'users/:user_id/tweets/:id/destroy' => 'tweets#destroy'
  # get 'users/:user_id/likes' => 'likes#index', as: :user_likes
  # post 'users/:user_id/likes/create' => 'likes#create', as: :like_create
  # delete 'users/:user_id/likes/:id/destroy' => 'likes#destroy', as: :like_destroy

  resources :users, only: [:index], shallow: true do
    resources :tweets, except: [:new, :edit, :update]
    resources :likes, only: [:index]
    resources :user_follow_relations, only: [:index, :create, :destroy]
  end

  resources :tweets, except: [:new, :edit, :update], shallow: true do
    resources :likes, only: [:create, :destroy]
    resources :replies, except: [:index, :edit, :update]
  end
  
  get 'tests/index' => 'tests#index'

end