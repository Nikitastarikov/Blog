Rails.application.routes.draw do
  devise_for :users

  root 'posts#index'
  get '/profiles/:id' => 'profiles#show', as: 'profile'
  # get 'comments#destroy', as: "comment_destroy"

  resources :posts do
    resources :comments
  end

  namespace :admin do
    resources :posts, except: %i[show index]
  end
end
