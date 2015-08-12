Rails.application.routes.draw do

  get 'admins/welcome_admin'

  resources :semesters
  resources :groups
  resources :courses
  resources :tasks
  resources :users
  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  resources :users
  delete 'logout' => 'sessions#destroy'
  get 'my_group' => 'students#my_group'
  get 'my_tasks' => 'students#my_tasks'
  get 'my_courses' => 'students#my_courses'
  get 'welcome' => 'students#index'
  get 'welcome_admin' => 'admins#index'
  get 'welcome_instructor' => 'instructors#index'
  get 'my_courses_instructor' => 'instructors#my_courses_instructor'
  get 'my_groups_instructor' => 'instructors#my_groups_instructor'
  get '404' => 'users#404'


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'sessions#new'

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
