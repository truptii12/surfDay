Rails.application.routes.draw do
  resources :cities

  resources :forecasts

  resources :locations

  get 'sessions/create'

  #get 'welcome/index'
  
  root "welcome#index"
  get "about" => "welcome#about", as: :about
  get "blog" => "welcome#blog", as: :blog
  
  
   # the :provider variable allows us to support different providers
   # (e.g. twitter, facebook, google, etc.)
   # otherwise we could have written ’auth/twitter/callback’ if we want
   # to support only twitter
  
   match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
   match 'auth/failure', to:  redirect("/") , via: [:get, :post]

   match 'signout', to: 'sessions#signout', via: [:get, :post]
   
   match 'twittertrends', to: 'welcome#twittertrends', via: [:get, :post]


   match 'customtweets', to: 'welcome#customtweets', via: [:get] 
   match 'morecustomtweets', to: 'welcome#morecustomtweets', via: [:get]
   
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
