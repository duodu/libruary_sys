LibruarySys::Application.routes.draw do
  match "books/manage" => "books#book_manage"
  match "books/manage/category" => "categories#show_cate"
  match "books/manage/category/add" => "categories#add_cate"
  match "books/manage/category/add_submit" => "categories#add_cate_submit"
  match "books/manage/add_newbook" => "books#add_newbook"
  match "books/manage/add_newbook_submit" => "books#add_submit"
  match "books/manage/edit/:id" => "books#edit_book"
  match "books/manage/update" => "books#update_book"
  match "books/manage/category/edit/:id" => "categories#edit_cate"
  match "books/manage/category/update/:id" => "categories#update_cate"
  match "books/manage/category/delete/:id" => "categories#delete_cate"
  match "books/borrow/:id" => "books#borrow"
  match "books/return/:id" => "books#return"
  match "books/login" => "users#login"
  match "books/logout" => "users#logout"
  match "users/regist" => "users#reg"
  match "users/reg_submit" => "users#reg_submit"
  match "users/edit/:id" => "users#edit"
  match "users/edit_submit/:id" => "users#edit_submit"
  match "users/history" => "users#history"
  match "books/show/:id" => "books#show"
  match "comments/add" => "comments#add_submit"
  match "books/list" => "books#list_cate"
  root :to => "books#list"
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
