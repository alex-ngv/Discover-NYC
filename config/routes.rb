Rails.application.routes.draw do

  resources :articles do
    resources :comments
    member do
      get :add_like
    end
  end

  root to: 'articles#index'
  resources :tags
  resources :users, only: [:new,:create]
  get '/users/profile' => 'users#profile', as: :profile
  get '/users/log_in' => 'users#log_in', as: :log_in
  post '/sessions' => 'sessions#create'
  delete '/sessions' => 'sessions#destroy'

end
