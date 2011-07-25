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
      get 'new_employee',"list_employees","delete_employee","change_status"
      post 'create_employee'
    end
  end

  resource :session, :only => [:new, :create, :destroy]

  resources :home do
    collection do
      get "configurations","occupations","contracts","facilities","pays","remove_occupation","remove_contract","remove_facility","remove_pay"
      post "add_occupation","add_contract","add_facility","add_pay"
    end
  end

  resource :organizations do
    collection do
      get "list","dashboard","all_reports","reports","statistics","change_status"
      get 'history/:id', :to  => "organizations#history", :as => :history
    end
  end

  resource :registrants do
    collection do
      get "profile","jobs_history"
      post "create_personal_data","create_skill","create_preference","create_pay","create_location","create_credential","upload_asset"
    end
  end

  resource :clients do
    collection do
      get "list","jobs_history","scheduled_history"
      post "create_basic_data", "create_addresses","create_billing","create_locations"
    end
  end

  resource :schedulers do
    collection do
      get "profile","jobs_history"
      post "create_profile_data"
    end
  end

  resource :jobs do
    collection do
      get "list","schedule","delete"
      post "list_registrants"
      get 'details/:id', :to  => "jobs#details", :as => :details
      get 'update_job/:id/:days/:key', :to  => "jobs#update_job", :as => :update_job
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
# Generated on 25 Jul 2011 16:55
#
#                         register        /register(.:format)                         {:action=>"create", :controller=>"users"}
#                            login        /login(.:format)                            {:action=>"new", :controller=>"sessions"}
#                           logout        /logout(.:format)                           {:action=>"destroy", :controller=>"sessions"}
#                         activate        /activate/:activation_code(.:format)        {:action=>"activate", :controller=>"users", :activation_code=>nil}
#                                         /(.:format)                                 {:action=>"index", :controller=>"home", :subdomain=>""}
#                                         /(.:format)                                 {:action=>"dashboard", :controller=>"organizations"}
#               new_employee_users GET    /users/new_employee(.:format)               {:action=>"new_employee", :controller=>"users"}
#             list_employees_users GET    /users/list_employees(.:format)             {:action=>"list_employees", :controller=>"users"}
#            delete_employee_users GET    /users/delete_employee(.:format)            {:action=>"delete_employee", :controller=>"users"}
#              change_status_users GET    /users/change_status(.:format)              {:action=>"change_status", :controller=>"users"}
#            create_employee_users POST   /users/create_employee(.:format)            {:action=>"create_employee", :controller=>"users"}
#                            users GET    /users(.:format)                            {:action=>"index", :controller=>"users"}
#                                  POST   /users(.:format)                            {:action=>"create", :controller=>"users"}
#                         new_user GET    /users/new(.:format)                        {:action=>"new", :controller=>"users"}
#                        edit_user GET    /users/:id/edit(.:format)                   {:action=>"edit", :controller=>"users"}
#                             user GET    /users/:id(.:format)                        {:action=>"show", :controller=>"users"}
#                                  PUT    /users/:id(.:format)                        {:action=>"update", :controller=>"users"}
#                                  DELETE /users/:id(.:format)                        {:action=>"destroy", :controller=>"users"}
#                          session POST   /session(.:format)                          {:action=>"create", :controller=>"sessions"}
#                      new_session GET    /session/new(.:format)                      {:action=>"new", :controller=>"sessions"}
#                                  DELETE /session(.:format)                          {:action=>"destroy", :controller=>"sessions"}
#        configurations_home_index GET    /home/configurations(.:format)              {:action=>"configurations", :controller=>"home"}
#           occupations_home_index GET    /home/occupations(.:format)                 {:action=>"occupations", :controller=>"home"}
#             contracts_home_index GET    /home/contracts(.:format)                   {:action=>"contracts", :controller=>"home"}
#            facilities_home_index GET    /home/facilities(.:format)                  {:action=>"facilities", :controller=>"home"}
#                  pays_home_index GET    /home/pays(.:format)                        {:action=>"pays", :controller=>"home"}
#     remove_occupation_home_index GET    /home/remove_occupation(.:format)           {:action=>"remove_occupation", :controller=>"home"}
#       remove_contract_home_index GET    /home/remove_contract(.:format)             {:action=>"remove_contract", :controller=>"home"}
#       remove_facility_home_index GET    /home/remove_facility(.:format)             {:action=>"remove_facility", :controller=>"home"}
#            remove_pay_home_index GET    /home/remove_pay(.:format)                  {:action=>"remove_pay", :controller=>"home"}
#        add_occupation_home_index POST   /home/add_occupation(.:format)              {:action=>"add_occupation", :controller=>"home"}
#          add_contract_home_index POST   /home/add_contract(.:format)                {:action=>"add_contract", :controller=>"home"}
#          add_facility_home_index POST   /home/add_facility(.:format)                {:action=>"add_facility", :controller=>"home"}
#               add_pay_home_index POST   /home/add_pay(.:format)                     {:action=>"add_pay", :controller=>"home"}
#                       home_index GET    /home(.:format)                             {:action=>"index", :controller=>"home"}
#                                  POST   /home(.:format)                             {:action=>"create", :controller=>"home"}
#                         new_home GET    /home/new(.:format)                         {:action=>"new", :controller=>"home"}
#                        edit_home GET    /home/:id/edit(.:format)                    {:action=>"edit", :controller=>"home"}
#                             home GET    /home/:id(.:format)                         {:action=>"show", :controller=>"home"}
#                                  PUT    /home/:id(.:format)                         {:action=>"update", :controller=>"home"}
#                                  DELETE /home/:id(.:format)                         {:action=>"destroy", :controller=>"home"}
#               list_organizations GET    /organizations/list(.:format)               {:action=>"list", :controller=>"organizations"}
#          dashboard_organizations GET    /organizations/dashboard(.:format)          {:action=>"dashboard", :controller=>"organizations"}
#        all_reports_organizations GET    /organizations/all_reports(.:format)        {:action=>"all_reports", :controller=>"organizations"}
#            reports_organizations GET    /organizations/reports(.:format)            {:action=>"reports", :controller=>"organizations"}
#         statistics_organizations GET    /organizations/statistics(.:format)         {:action=>"statistics", :controller=>"organizations"}
#      change_status_organizations GET    /organizations/change_status(.:format)      {:action=>"change_status", :controller=>"organizations"}
#            history_organizations GET    /organizations/history/:id(.:format)        {:action=>"history", :controller=>"organizations"}
#                    organizations POST   /organizations(.:format)                    {:action=>"create", :controller=>"organizations"}
#                new_organizations GET    /organizations/new(.:format)                {:action=>"new", :controller=>"organizations"}
#               edit_organizations GET    /organizations/edit(.:format)               {:action=>"edit", :controller=>"organizations"}
#                                  GET    /organizations(.:format)                    {:action=>"show", :controller=>"organizations"}
#                                  PUT    /organizations(.:format)                    {:action=>"update", :controller=>"organizations"}
#                                  DELETE /organizations(.:format)                    {:action=>"destroy", :controller=>"organizations"}
#              profile_registrants GET    /registrants/profile(.:format)              {:action=>"profile", :controller=>"registrants"}
#         jobs_history_registrants GET    /registrants/jobs_history(.:format)         {:action=>"jobs_history", :controller=>"registrants"}
# create_personal_data_registrants POST   /registrants/create_personal_data(.:format) {:action=>"create_personal_data", :controller=>"registrants"}
#         create_skill_registrants POST   /registrants/create_skill(.:format)         {:action=>"create_skill", :controller=>"registrants"}
#    create_preference_registrants POST   /registrants/create_preference(.:format)    {:action=>"create_preference", :controller=>"registrants"}
#           create_pay_registrants POST   /registrants/create_pay(.:format)           {:action=>"create_pay", :controller=>"registrants"}
#      create_location_registrants POST   /registrants/create_location(.:format)      {:action=>"create_location", :controller=>"registrants"}
#    create_credential_registrants POST   /registrants/create_credential(.:format)    {:action=>"create_credential", :controller=>"registrants"}
#         upload_asset_registrants POST   /registrants/upload_asset(.:format)         {:action=>"upload_asset", :controller=>"registrants"}
#                      registrants POST   /registrants(.:format)                      {:action=>"create", :controller=>"registrants"}
#                  new_registrants GET    /registrants/new(.:format)                  {:action=>"new", :controller=>"registrants"}
#                 edit_registrants GET    /registrants/edit(.:format)                 {:action=>"edit", :controller=>"registrants"}
#                                  GET    /registrants(.:format)                      {:action=>"show", :controller=>"registrants"}
#                                  PUT    /registrants(.:format)                      {:action=>"update", :controller=>"registrants"}
#                                  DELETE /registrants(.:format)                      {:action=>"destroy", :controller=>"registrants"}
#                     list_clients GET    /clients/list(.:format)                     {:action=>"list", :controller=>"clients"}
#             jobs_history_clients GET    /clients/jobs_history(.:format)             {:action=>"jobs_history", :controller=>"clients"}
#        scheduled_history_clients GET    /clients/scheduled_history(.:format)        {:action=>"scheduled_history", :controller=>"clients"}
#        create_basic_data_clients POST   /clients/create_basic_data(.:format)        {:action=>"create_basic_data", :controller=>"clients"}
#         create_addresses_clients POST   /clients/create_addresses(.:format)         {:action=>"create_addresses", :controller=>"clients"}
#           create_billing_clients POST   /clients/create_billing(.:format)           {:action=>"create_billing", :controller=>"clients"}
#         create_locations_clients POST   /clients/create_locations(.:format)         {:action=>"create_locations", :controller=>"clients"}
#                          clients POST   /clients(.:format)                          {:action=>"create", :controller=>"clients"}
#                      new_clients GET    /clients/new(.:format)                      {:action=>"new", :controller=>"clients"}
#                     edit_clients GET    /clients/edit(.:format)                     {:action=>"edit", :controller=>"clients"}
#                                  GET    /clients(.:format)                          {:action=>"show", :controller=>"clients"}
#                                  PUT    /clients(.:format)                          {:action=>"update", :controller=>"clients"}
#                                  DELETE /clients(.:format)                          {:action=>"destroy", :controller=>"clients"}
#               profile_schedulers GET    /schedulers/profile(.:format)               {:action=>"profile", :controller=>"schedulers"}
#          jobs_history_schedulers GET    /schedulers/jobs_history(.:format)          {:action=>"jobs_history", :controller=>"schedulers"}
#   create_profile_data_schedulers POST   /schedulers/create_profile_data(.:format)   {:action=>"create_profile_data", :controller=>"schedulers"}
#                       schedulers POST   /schedulers(.:format)                       {:action=>"create", :controller=>"schedulers"}
#                   new_schedulers GET    /schedulers/new(.:format)                   {:action=>"new", :controller=>"schedulers"}
#                  edit_schedulers GET    /schedulers/edit(.:format)                  {:action=>"edit", :controller=>"schedulers"}
#                                  GET    /schedulers(.:format)                       {:action=>"show", :controller=>"schedulers"}
#                                  PUT    /schedulers(.:format)                       {:action=>"update", :controller=>"schedulers"}
#                                  DELETE /schedulers(.:format)                       {:action=>"destroy", :controller=>"schedulers"}
#                        list_jobs GET    /jobs/list(.:format)                        {:action=>"list", :controller=>"jobs"}
#                    schedule_jobs GET    /jobs/schedule(.:format)                    {:action=>"schedule", :controller=>"jobs"}
#                      delete_jobs GET    /jobs/delete(.:format)                      {:action=>"delete", :controller=>"jobs"}
#            list_registrants_jobs POST   /jobs/list_registrants(.:format)            {:action=>"list_registrants", :controller=>"jobs"}
#                     details_jobs GET    /jobs/details/:id(.:format)                 {:action=>"details", :controller=>"jobs"}
#                  update_job_jobs GET    /jobs/update_job/:id/:days/:key(.:format)   {:action=>"update_job", :controller=>"jobs"}
#                             jobs POST   /jobs(.:format)                             {:action=>"create", :controller=>"jobs"}
#                         new_jobs GET    /jobs/new(.:format)                         {:action=>"new", :controller=>"jobs"}
#                        edit_jobs GET    /jobs/edit(.:format)                        {:action=>"edit", :controller=>"jobs"}
#                                  GET    /jobs(.:format)                             {:action=>"show", :controller=>"jobs"}
#                                  PUT    /jobs(.:format)                             {:action=>"update", :controller=>"jobs"}
#                                  DELETE /jobs(.:format)                             {:action=>"destroy", :controller=>"jobs"}
#                             root        /(.:format)                                 {:action=>"index", :controller=>"home"}
