Rails.application.routes.draw do

  root 'products#index'

  resources :products do #generates the 7 RESTful routes for products and do nested routes
    resources :reviews, only: [:show, :create, :destroy] #Nested routes allow you to capture an associative relationship in your routing
      # get 'prodcuts/:id/reviews/show'
      # get 'products/:id/reviews/create'
      # get 'products/:id/reviews/destroy'
  end

  resources :users, only: [:new, :create] # for the users controller, only create the new and create routes
    # get 'users/new'
    # get 'users/create'
  resource :sessions, only: [:new, :create, :destroy]
  get 'login' => 'sessions#new', as: :login
    # get 'sessions/new'
    # get 'sessions/create'
    # get 'sessions/destroy'


end

#7 RESTful Routes:
  #1 get 'products/index' => 'products#index'
  #2 post 'products' => 'products#create'
  #3 get 'products/new' => 'products#new'
  #4 get 'products/edit' => 'products#edit', as: 'edit_picture'
  #5 get 'products/:id' => 'products#show', as 'product'
  #6 patch 'products/:id' => 'products#update'
  #6 put 'products/:id' => 'products#update'
  #7 deltee 'products/:id' => 'products#destroy'

####################

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
