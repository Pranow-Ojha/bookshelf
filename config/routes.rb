Rails.application.routes.draw do
  
  # get 'cart/add'

  get 'cart/index'

  get 'pages/home'

  get 'pages/about'

  get 'pages/event'

  get 'pages/contact'

  get 'pages/blogs'

  get 'pages/carriers'

  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
 #resource :admin_session

root to: 'books#index'
devise_for :users
devise_scope :user do
authenticated :user do
resources :books
root 'books#index', as: :authenticated_root
end
root to: "devise/sessions#new"
end

 
  resources :books do
  resources :comments ,:only => :create
  end

# map.connect ":controller/:action/:id"
match ':controller/:action/:id(.:format)' , via: [:get, :post]
#match 'cart/:id', controller: 'cart', action: 'add', via: [:get, :post]


end

