Rails.application.routes.draw do
  get 'todos/:page', to: 'todos#index'
  post 'todos', to: 'todos#create'
  get 'todo/:id', to: 'todos#show'
  patch 'todo/:id', to: 'todos#update'
  delete 'todo/:id', to: 'todos#destroy'
end
