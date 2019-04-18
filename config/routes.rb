Rails.application.routes.draw do

  get 'about/show'

  get 'signup', to: 'users#new', as: 'signup'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  get 'about' => 'about#show'

  resources :users
  resources :sessions
  resources :companies

  resources :invoices do
    resources :tasks
  end

  resources :password_resets

  get 'password_resets/new'
  post 'password_resets/create'
  post 'password_resets/edit'
  get 'resumes/new'
  root 'dashboards#index'
end
