Rails.application.routes.draw do
  devise_for :users

  root 'posts#index'
  get '/profiles/:id' => 'profiles#show', as: "profile"

  resources :posts

  namespace :admin do
    resources :posts, except: %i[show index]
  end
end
