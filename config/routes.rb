Rails.application.routes.draw do
  root   'pages#home'
  get    'help'    => 'pages#help'
  get    'about'   => 'pages#about'
  get    'contact' => 'pages#contact'
  get    'signup'  => 'users#new'
  get    'signin'  => 'sessions#new'
  post   'signup'  => 'users#create'
  post   'signin'  => 'sessions#create'
  delete 'signout' => 'sessions#destroy'
  resources :categories
  resources :recipes
end
