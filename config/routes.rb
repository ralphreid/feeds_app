FeedxApp::Application.routes.draw do
  devise_for  :users,
              :controllers => {
                :registrations => 'users',
                :omniauth_callbacks => "omniauth_callbacks"
              }

  devise_scope :user do
    # get "/users/show/:id" => "users#show"
    resources :users, :only => [:show]
  end

  match '/feeds/find' => 'feeds#find', as: :find_feed
  match '/feeds/categories' => 'feeds#categories', as: :categories_feed
  match '/feeds/my_feeds' => 'feeds#my_feeds', as: :my_feeds

  match '/articles/my_bookmarks' => 'articles#my_bookmarks', as: :my_bookmarks

  resources :feeds do
    resources :articles do
      post 'bookmark', :on => :member
      put 'unbookmark', :on => :member
      post 'archive', :on => :member
      put 'unarchive', :on => :member
    end

    post 'subscribe', :on => :member
    put 'unsubscribe', :on => :member
    put 'hide_on_profile', :on => :member
    put 'show_on_profile', :on => :member
  end

  get '/feed-not-found' => 'errors#feed_not_found', as: :feed_not_found

  match '/404', :to => 'errors#not_found'
  match '/422', :to => 'errors#server_error'
  match '/500', :to => 'errors#server_error'

  get '/public_home', to: 'feeds#public_home', as: :public_home

  # get '/heyjude' => 'feeds#heyjude', as: :heyjude

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
  # Required Devise config: "Ensure you have defined root_url to *something* in your config/routes.rb"
  root :to => 'feeds#public_home'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
