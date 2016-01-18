Rails.application.routes.draw do
  get 'sessions/new'
  get 'orders/add_order'
  get 'orders/index'
  get 'orders/pay'
  
#resources :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  get 'books/index'
  resources :books
  resources :authors
  #resources :orders
  resources :publishers
  resources :users 
 # get "users/destroy/:id",to:"users#destroy",as:"destroy"
  resources :sessions
  # You can have the root of your site routed with "root"
   root 'ecoms#index'
   get 'logout',to:'sessions#destroy',as: 'logout'
   get 'login',to:'sessions#new',as: 'login'
   get 'signup',to:'users#new',as: 'signup'
   # get "users/destroy",to:'users#destroy',as: 'destroy'
  # get 'carts/index'
  # get 'carts/clearCart'
    get "/carts/:id"=>'carts#add'
    #get 'carts/index'
    get "/carts"=>'carts#index'
   # get "/carts"=>'carts#index'
     #get "/carts/clear",to:'carts#clearCart',as:'clearCart'
     get "/carts/clear"=>'carts#clear_cart'
    # get "/carts/:id",to:'carts#destroy',as:'destroy'
     #get "carts/remove_book_from_cart"
     #get "carts/:id"=>'carts#destroy',as:'destroy'
     get "carts/destory/:id",to:"carts#destroy",as:"destory"
     #get "orders/add_order/:id/:quantity",to:"orders#add_order",as:"addorder"
     

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
end
