Rails.application.routes.draw do
  
  root to: 'tasks#index'
  
  get 'ユーザー登録', to: 'users#new'
  resources :users, only:[ :show, :create, :edit, :destroy]
  resources :tasks
end
