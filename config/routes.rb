Rails.application.routes.draw do
  devise_for :users

  root 'posts#index'
  get '/profiles/:id' => 'profiles#show', as: 'profile'
  get '/table_mmr/:id' => 'table_mmr#index', as: 'table_mmr'

  resources :posts do
    resources :likes
    resources :comments
  end
  # get '/posts/:id/like' => 'posts#like', as: 'like_post'
  # get '/posts/:id/dislike' => 'posts#dislike', as: 'dislike_post'
end
