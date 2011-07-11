Training::Application.routes.draw do
  resources :users

  resource :session, :only => [:new, :create, :destroy]

  match 'signup' => 'users#new', :as => :signup

  match 'register' => 'users#create', :as => :register

  match 'login' => 'sessions#new', :as => :login

  match 'logout' => 'sessions#destroy', :as => :logout

  match '/activate/:activation_code' => 'users#activate', :as => :activate, :activation_code => nil

  resources :home

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => "home#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
#== Route Map
# Generated on 11 Jul 2011 20:01
#
#             POST   /users(.:format)                     {:action=>"create", :controller=>"users"}
#    new_user GET    /users/new(.:format)                 {:action=>"new", :controller=>"users"}
#   edit_user GET    /users/:id/edit(.:format)            {:action=>"edit", :controller=>"users"}
#        user GET    /users/:id(.:format)                 {:action=>"show", :controller=>"users"}
#             PUT    /users/:id(.:format)                 {:action=>"update", :controller=>"users"}
#             DELETE /users/:id(.:format)                 {:action=>"destroy", :controller=>"users"}
#     session POST   /session(.:format)                   {:action=>"create", :controller=>"sessions"}
# new_session GET    /session/new(.:format)               {:action=>"new", :controller=>"sessions"}
#             DELETE /session(.:format)                   {:action=>"destroy", :controller=>"sessions"}
#      signup        /signup(.:format)                    {:action=>"new", :controller=>"users"}
#    register        /register(.:format)                  {:action=>"create", :controller=>"users"}
#       login        /login(.:format)                     {:action=>"new", :controller=>"sessions"}
#      logout        /logout(.:format)                    {:action=>"destroy", :controller=>"sessions"}
#    activate        /activate/:activation_code(.:format) {:action=>"activate", :activation_code=>nil, :controller=>"users"}
#  home_index GET    /home(.:format)                      {:action=>"index", :controller=>"home"}
#             POST   /home(.:format)                      {:action=>"create", :controller=>"home"}
#    new_home GET    /home/new(.:format)                  {:action=>"new", :controller=>"home"}
#   edit_home GET    /home/:id/edit(.:format)             {:action=>"edit", :controller=>"home"}
#        home GET    /home/:id(.:format)                  {:action=>"show", :controller=>"home"}
#             PUT    /home/:id(.:format)                  {:action=>"update", :controller=>"home"}
#             DELETE /home/:id(.:format)                  {:action=>"destroy", :controller=>"home"}
#        root        /(.:format)                          {:action=>"index", :controller=>"home"}
