Nspeed::Application.routes.draw do
  mount RailsAdmin::Engine => '/super_admin', :as => 'rails_admin'

  devise_for :users

  resources :projects do
    resources :documents do
      get 'by_requirement', :on => :collection
      resources :document_assets
    end
    resources :material_trackings
    resources :people
    resources :submittals
  end

  resources :materials do
    get 'related_materials'
  end

  namespace :admin do
    resources :companies
  end

  namespace :company_admin do
    resource :dashboard
    resources :projects do
      resources :project_requirements
      resources :submittal_statuses
      resources :prerequisites
      resources :project_people do
        collection do
          post 'save'
        end
        member do
          delete 'remove'
        end
      end
      get 'roles'
    end
    resources :customers
    resources :project_types
    resources :people
    resources :roles
    resources :users
  end

  resources :custom_fields
  root :to => 'dashboard#index'

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
  # match ':controller(/:action(/:id(.:format)))'
end
