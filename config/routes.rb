Rails.application.routes.draw do
  get 'landings/index'

  resources :experiments
  post 'refresh_from_optimizely' => 'experiments#refresh', :as => :refresh_optimizely

  devise_for :users, controllers: {registrations: "users/registrations", sessions: "users/sessions", passwords: "users/passwords"}, skip: [:sessions, :registrations]
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  get 'connect_optimizely' => 'optimizely_setup#edit', :as => :edit_optimizely_setup
  put 'connect_optimizely' => 'optimizely_setup#update', :as => :update_optimizely_setup

  # You can have the root of your site routed with "root"
  root 'landings#index'
  
  #->Prelang (user_login:devise/stylized_paths)
  devise_scope :user do
    get    "login"   => "users/sessions#new",         as: :new_user_session
    post   "login"   => "users/sessions#create",      as: :user_session
    delete "signout" => "users/sessions#destroy",     as: :destroy_user_session
    
    get    "signup"  => "users/registrations#new",    as: :new_user_registration
    post   "signup"  => "users/registrations#create", as: :user_registration
    put    "signup"  => "users/registrations#update", as: :update_user_registration
    get    "account" => "users/registrations#edit",   as: :edit_user_registration
  end

end
