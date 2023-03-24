Rails.application.routes.draw do
  resources :items do
    collection do 
      post :import
    end
  end
  resources :programs
  resources :courses
  resources :staffs
  mount EpiCas::Engine, at: "/"
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # main controller routes
  post 'set_module_index', to: 'main#set_module_index'
  post 'set_search', to: 'main#set_search'

  # Defines the root path route ("/")
  root "main#home"
end
