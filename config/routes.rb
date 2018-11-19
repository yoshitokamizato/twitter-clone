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

  # resources :tweets, only: [:index, :create], format: 'json'
  get 'tweets/index' => 'tweets#index'
  post 'tweets/create' => 'tweets#create'

end
