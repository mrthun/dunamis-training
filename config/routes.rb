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
      get 'new_employee',"list_employees","delete_employee"
      post 'create_employee'
    end
  end

  resource :session, :only => [:new, :create, :destroy]
  resources :home
  resource :organizations
  resource :profiles do
    collection do
      get "my_profile"
      post "create_personal_data","create_skill","create_preference","create_pay","create_location","create_credential","upload_asset"
    end
  end

  resource :clients do
    collection do
      get "list"
      post "create_basic_data", "create_addresses","create_billing","create_locations"
    end
  end

  resource :jobs do
    collection do
      get "list","schedule","delete"
      post "list_registrants"
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
# Generated on 20 Jul 2011 14:55
#
#                      register        /register(.:format)                      {:action=>"create", :controller=>"users"}
#                         login        /login(.:format)                         {:action=>"new", :controller=>"sessions"}
#                        logout        /logout(.:format)                        {:action=>"destroy", :controller=>"sessions"}
#                      activate        /activate/:activation_code(.:format)     {:action=>"activate", :activation_code=>nil, :controller=>"users"}
#                                      /(.:format)                              {:action=>"index", :controller=>"home", :subdomain=>""}
#                                      /(.:format)                              {:action=>"dashboard", :controller=>"organizations"}
#            new_employee_users GET    /users/new_employee(.:format)            {:action=>"new_employee", :controller=>"users"}
#          list_employees_users GET    /users/list_employees(.:format)          {:action=>"list_employees", :controller=>"users"}
#         delete_employee_users GET    /users/delete_employee(.:format)         {:action=>"delete_employee", :controller=>"users"}
#         create_employee_users POST   /users/create_employee(.:format)         {:action=>"create_employee", :controller=>"users"}
#                         users GET    /users(.:format)                         {:action=>"index", :controller=>"users"}
#                               POST   /users(.:format)                         {:action=>"create", :controller=>"users"}
#                      new_user GET    /users/new(.:format)                     {:action=>"new", :controller=>"users"}
#                     edit_user GET    /users/:id/edit(.:format)                {:action=>"edit", :controller=>"users"}
#                          user GET    /users/:id(.:format)                     {:action=>"show", :controller=>"users"}
#                               PUT    /users/:id(.:format)                     {:action=>"update", :controller=>"users"}
#                               DELETE /users/:id(.:format)                     {:action=>"destroy", :controller=>"users"}
#                       session POST   /session(.:format)                       {:action=>"create", :controller=>"sessions"}
#                   new_session GET    /session/new(.:format)                   {:action=>"new", :controller=>"sessions"}
#                               DELETE /session(.:format)                       {:action=>"destroy", :controller=>"sessions"}
#                    home_index GET    /home(.:format)                          {:action=>"index", :controller=>"home"}
#                               POST   /home(.:format)                          {:action=>"create", :controller=>"home"}
#                      new_home GET    /home/new(.:format)                      {:action=>"new", :controller=>"home"}
#                     edit_home GET    /home/:id/edit(.:format)                 {:action=>"edit", :controller=>"home"}
#                          home GET    /home/:id(.:format)                      {:action=>"show", :controller=>"home"}
#                               PUT    /home/:id(.:format)                      {:action=>"update", :controller=>"home"}
#                               DELETE /home/:id(.:format)                      {:action=>"destroy", :controller=>"home"}
#                 organizations POST   /organizations(.:format)                 {:action=>"create", :controller=>"organizations"}
#             new_organizations GET    /organizations/new(.:format)             {:action=>"new", :controller=>"organizations"}
#            edit_organizations GET    /organizations/edit(.:format)            {:action=>"edit", :controller=>"organizations"}
#                               GET    /organizations(.:format)                 {:action=>"show", :controller=>"organizations"}
#                               PUT    /organizations(.:format)                 {:action=>"update", :controller=>"organizations"}
#                               DELETE /organizations(.:format)                 {:action=>"destroy", :controller=>"organizations"}
#           my_profile_profiles GET    /profiles/my_profile(.:format)           {:action=>"my_profile", :controller=>"profiles"}
# create_personal_data_profiles POST   /profiles/create_personal_data(.:format) {:action=>"create_personal_data", :controller=>"profiles"}
#         create_skill_profiles POST   /profiles/create_skill(.:format)         {:action=>"create_skill", :controller=>"profiles"}
#    create_preference_profiles POST   /profiles/create_preference(.:format)    {:action=>"create_preference", :controller=>"profiles"}
#           create_pay_profiles POST   /profiles/create_pay(.:format)           {:action=>"create_pay", :controller=>"profiles"}
#      create_location_profiles POST   /profiles/create_location(.:format)      {:action=>"create_location", :controller=>"profiles"}
#    create_credential_profiles POST   /profiles/create_credential(.:format)    {:action=>"create_credential", :controller=>"profiles"}
#         upload_asset_profiles POST   /profiles/upload_asset(.:format)         {:action=>"upload_asset", :controller=>"profiles"}
#                      profiles POST   /profiles(.:format)                      {:action=>"create", :controller=>"profiles"}
#                  new_profiles GET    /profiles/new(.:format)                  {:action=>"new", :controller=>"profiles"}
#                 edit_profiles GET    /profiles/edit(.:format)                 {:action=>"edit", :controller=>"profiles"}
#                               GET    /profiles(.:format)                      {:action=>"show", :controller=>"profiles"}
#                               PUT    /profiles(.:format)                      {:action=>"update", :controller=>"profiles"}
#                               DELETE /profiles(.:format)                      {:action=>"destroy", :controller=>"profiles"}
#                  list_clients GET    /clients/list(.:format)                  {:action=>"list", :controller=>"clients"}
#     create_basic_data_clients POST   /clients/create_basic_data(.:format)     {:action=>"create_basic_data", :controller=>"clients"}
#      create_addresses_clients POST   /clients/create_addresses(.:format)      {:action=>"create_addresses", :controller=>"clients"}
#        create_billing_clients POST   /clients/create_billing(.:format)        {:action=>"create_billing", :controller=>"clients"}
#      create_locations_clients POST   /clients/create_locations(.:format)      {:action=>"create_locations", :controller=>"clients"}
#                       clients POST   /clients(.:format)                       {:action=>"create", :controller=>"clients"}
#                   new_clients GET    /clients/new(.:format)                   {:action=>"new", :controller=>"clients"}
#                  edit_clients GET    /clients/edit(.:format)                  {:action=>"edit", :controller=>"clients"}
#                               GET    /clients(.:format)                       {:action=>"show", :controller=>"clients"}
#                               PUT    /clients(.:format)                       {:action=>"update", :controller=>"clients"}
#                               DELETE /clients(.:format)                       {:action=>"destroy", :controller=>"clients"}
#                     list_jobs GET    /jobs/list(.:format)                     {:action=>"list", :controller=>"jobs"}
#                 schedule_jobs GET    /jobs/schedule(.:format)                 {:action=>"schedule", :controller=>"jobs"}
#         list_registrants_jobs POST   /jobs/list_registrants(.:format)         {:action=>"list_registrants", :controller=>"jobs"}
#                          jobs POST   /jobs(.:format)                          {:action=>"create", :controller=>"jobs"}
#                      new_jobs GET    /jobs/new(.:format)                      {:action=>"new", :controller=>"jobs"}
#                     edit_jobs GET    /jobs/edit(.:format)                     {:action=>"edit", :controller=>"jobs"}
#                               GET    /jobs(.:format)                          {:action=>"show", :controller=>"jobs"}
#                               PUT    /jobs(.:format)                          {:action=>"update", :controller=>"jobs"}
#                               DELETE /jobs(.:format)                          {:action=>"destroy", :controller=>"jobs"}
#                          root        /(.:format)                              {:action=>"index", :controller=>"home"}
