Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"


  namespace :api do 
    namespace :v1 do
      get 'get_user', action: :getUsers, controller: :users
      post 'add_user', action: :addUsers, controller: :users
      get 'show_user', action: :show, controller: :users
      put 'update_user', action: :updateUser, controller: :users
      delete 'delet_user', action: :deleteUser, controller: :users
    end
  end
end
