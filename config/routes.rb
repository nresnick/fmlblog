Rails.application.routes.draw do

  get 'password_resets/new'
  get 'password_resets/edit'
  get 'sessions/new'
  root                'static_pages#home'
  get    'help'    => 'users#help'
  get    'about'   => 'static_pages#about'
  get    'contact.rb' => 'static_pages#contact.rb'
  get    'signup'  => 'users#new'
  get    'login'   => 'sessions#new' #login page
  post   'login'   => 'sessions#create' #actual log in process
  delete 'logout'  => 'sessions#destroy'
  get    'contacts' => 'contacts#new'

  resources :users do
    member do
      get :following, :followers #member makes sure that the url is users/id/following so the id is included
    end
  end

  resources :posts do
    resources :comments
  end

  resources :topics

  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :contacts,           only: [:new, :create]


  mount Ckeditor::Engine => '/ckeditor'

end
