Training::Application.routes.draw do

  match 'signup' => 'users#new', :as => :signup
  match 'register' => 'users#create', :as => :register
  match 'login' => 'sessions#new', :as => :login
  match 'logout' => 'sessions#destroy', :as => :logout
  match '/activate/:activation_code' => 'users#activate', :as => :activate, :activation_code => nil

  match '/' => 'home#index', :constraints => { :subdomain => "" }
 
  constraints(Subdomains) do
    match '/' => 'organizations#dashboard'
  end

  resources :users do
    collection do
      get 'new_employee'
      post 'create_employee'
    end
  end

  resource :session, :only => [:new, :create, :destroy]
  resources :home
  resource :organizations
  resource :profiles do
    collection do
      get "personal_data","skills","preferences","pays","credentials","locations"
    end
  end

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
# Generated on 13 Jul 2011 19:38
#
#               register        /register(.:format)                  {:controller=>"users", :action=>"create"}
#                  login        /login(.:format)                     {:controller=>"sessions", :action=>"new"}
#                 logout        /logout(.:format)                    {:controller=>"sessions", :action=>"destroy"}
#               activate        /activate/:activation_code(.:format) {:controller=>"users", :action=>"activate", :activation_code=>nil}
#                               /(.:format)                          {:controller=>"home", :subdomain=>"", :action=>"index"}
#                               /(.:format)                          {:controller=>"organizations", :action=>"dashboard"}
#     new_employee_users GET    /users/new_employee(.:format)        {:controller=>"users", :action=>"new_employee"}
#  create_employee_users POST   /users/create_employee(.:format)     {:controller=>"users", :action=>"create_employee"}
#                  users GET    /users(.:format)                     {:controller=>"users", :action=>"index"}
#                        POST   /users(.:format)                     {:controller=>"users", :action=>"create"}
#               new_user GET    /users/new(.:format)                 {:controller=>"users", :action=>"new"}
#              edit_user GET    /users/:id/edit(.:format)            {:controller=>"users", :action=>"edit"}
#                   user GET    /users/:id(.:format)                 {:controller=>"users", :action=>"show"}
#                        PUT    /users/:id(.:format)                 {:controller=>"users", :action=>"update"}
#                        DELETE /users/:id(.:format)                 {:controller=>"users", :action=>"destroy"}
#                session POST   /session(.:format)                   {:controller=>"sessions", :action=>"create"}
#            new_session GET    /session/new(.:format)               {:controller=>"sessions", :action=>"new"}
#                        DELETE /session(.:format)                   {:controller=>"sessions", :action=>"destroy"}
#             home_index GET    /home(.:format)                      {:controller=>"home", :action=>"index"}
#                        POST   /home(.:format)                      {:controller=>"home", :action=>"create"}
#               new_home GET    /home/new(.:format)                  {:controller=>"home", :action=>"new"}
#              edit_home GET    /home/:id/edit(.:format)             {:controller=>"home", :action=>"edit"}
#                   home GET    /home/:id(.:format)                  {:controller=>"home", :action=>"show"}
#                        PUT    /home/:id(.:format)                  {:controller=>"home", :action=>"update"}
#                        DELETE /home/:id(.:format)                  {:controller=>"home", :action=>"destroy"}
#          organizations POST   /organizations(.:format)             {:controller=>"organizations", :action=>"create"}
#      new_organizations GET    /organizations/new(.:format)         {:controller=>"organizations", :action=>"new"}
#     edit_organizations GET    /organizations/edit(.:format)        {:controller=>"organizations", :action=>"edit"}
#                        GET    /organizations(.:format)             {:controller=>"organizations", :action=>"show"}
#                        PUT    /organizations(.:format)             {:controller=>"organizations", :action=>"update"}
#                        DELETE /organizations(.:format)             {:controller=>"organizations", :action=>"destroy"}
# personal_data_profiles GET    /profiles/personal_data(.:format)    {:controller=>"profiles", :action=>"personal_data"}
#        skills_profiles GET    /profiles/skills(.:format)           {:controller=>"profiles", :action=>"skills"}
#    prefrences_profiles GET    /profiles/prefrences(.:format)       {:controller=>"profiles", :action=>"prefrences"}
#          pays_profiles GET    /profiles/pays(.:format)             {:controller=>"profiles", :action=>"pays"}
#   credentails_profiles GET    /profiles/credentails(.:format)      {:controller=>"profiles", :action=>"credentails"}
#     locations_profiles GET    /profiles/locations(.:format)        {:controller=>"profiles", :action=>"locations"}
#               profiles POST   /profiles(.:format)                  {:controller=>"profiles", :action=>"create"}
#           new_profiles GET    /profiles/new(.:format)              {:controller=>"profiles", :action=>"new"}
#          edit_profiles GET    /profiles/edit(.:format)             {:controller=>"profiles", :action=>"edit"}
#                        GET    /profiles(.:format)                  {:controller=>"profiles", :action=>"show"}
#                        PUT    /profiles(.:format)                  {:controller=>"profiles", :action=>"update"}
#                        DELETE /profiles(.:format)                  {:controller=>"profiles", :action=>"destroy"}
#                   root        /(.:format)                          {:controller=>"home", :action=>"index"}
