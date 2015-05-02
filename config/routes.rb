HepBProject::Application.routes.draw do

  devise_for :members, controllers: {
    sessions: 'members/sessions',
    registrations: 'members/registrations'
  }
  root :to => redirect('/members/sign_in')

  get 'members/:id/dashboard_home', to: 'members#dashboard_home', as: 'members_dashboard_home'
  post 'members/:id/dashboard_home', to: 'members#dashboard_home', as: 'members_dashboard_home'
  get 'members/:id/announcements', to: 'members#announcements', as: 'members_announcements'
  post 'members/:id/announcements', to: 'members#announcements', as: 'members_announcements'
  get 'members/:id/contacts', to: 'members#contacts', as: 'members_contacts'
  get 'members/:id/stats', to: 'members#stats', as: 'members_stats'
  post 'members/:id/get_announcement', to: 'members#edit_announcement', as: 'members_edit_announcement'
  get 'members/:id/admin_settings', to: 'members#admin_settings', as: 'members_admin_settings'
  put 'members/:id/admin_settings', to:'members#update_admin_settings', as: 'members_update_admin_settings'
  get 'settings/:id', to: 'settings#index', as: 'settings_index'
  put 'settings/:id', to:'settings#update', as: 'settings_update'

  resources :members do
    delete :delete_announcement, :on => :member
    post :pin_announcement, :on => :member
    get :get_announcement, :on => :member
  end

  get 'members/:id/settings', to: 'members#settings_index', as: 'members_settings_index'
  post 'members/:id/settings', to: 'members#settings', as: 'members_settings'

  get 'events', to: 'events#index', as: 'events_index'
  post 'events', to: 'events#create'
  get 'event/:id', to: 'events#show', as: 'event'
  post 'event/:id', to: 'events#signup', as: 'events_signup'
  delete 'event/:id', to: 'events#remove_member', as: 'events_remove_member'
  put 'event/:id', to: 'events#update', as: 'events_update'
  delete 'event/:id/member/:member_id', to: 'events#remove_other_member', as: 'events_remove_other_member'
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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
