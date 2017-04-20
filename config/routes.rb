Rails.application.routes.draw do

  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

  controller :admin_login do
    get 'admin_login' => :new
    post 'admin_login' => :create
    delete 'admin_logout' => :destroy
  end

  resources :groups
  resources :comments
  resources :messages
  resources :bots
  resources :users
  resources :admins, only: [:show]
  resources :user_groups, only: [:new,:edit, :create,:update, :destroy]
  resources :tasks, only: [:show, :new,:edit, :create,:update, :destroy]
  resources :key_words, only: [:new, :create, :destroy]
  resources :group_messager, only: [:new,:edit, :create,:update]


  root 'sessions#new'
  get 'activate_bot/activate'
  get 'tasks/refresh_part'
end
