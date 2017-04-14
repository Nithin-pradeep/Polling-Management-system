Rails.application.routes.draw do

 get  '/signup',  to: 'users#new'

  get '/help', to: 'static_pages#help'
  
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  post '/signup',  to: 'users#create' ,as: 'user_create'
  
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
  #polling
  get '/polls', to: 'polls#index', as: 'polls'
  resources :polls
  resources :users
  resources :votes, only: [:create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#home'
end
