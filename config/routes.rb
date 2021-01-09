Rails.application.routes.draw do
  devise_for :users

  root 'posts#index'
  get '/show/:id' => 'profiles#show', as: 'profile'
  get '/moderator/:id' => 'profiles#moderator', as: 'moderator'
  get '/del_moderator/:id' => 'profiles#del_moderator', as: 'del_moderator'
  get '/index/:id' => 'table_mmr#index', as: 'table_mmr'

  resources :posts do
    resources :likes
    resources :comments
  end
end
