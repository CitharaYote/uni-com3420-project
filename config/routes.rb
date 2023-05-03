Rails.application.routes.draw do
  resources :current_users
  resources :students do
    post :search, on: :collection
    collection do
      post :import
    end
  end
  resources :programs do
    post :search, on: :collection
  end
  resources :courses do
    post :search, on: :collection
  end
  resources :staffs
  resources :notifications
  
  # resources :current_users
  mount EpiCas::Engine, at: "/"
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # main controller routes
  post 'set_module_index', to: 'main#set_module_index'
  post 'set_search', to: 'main#set_search'
  post '/', to: 'main#home'

  get 'course_detail',to: "students#course_detail"
 
  # Defines the root path route ("/")
  root "main#home"
end
