Rails.application.routes.draw do   
  namespace :pagodite do

    resources :pagodite_users, :except => [:edit, :update]

    namespace :image do 
      post :upload
    end

    namespace :profile do 
      get :index
      get :view
      get :edit
      put :update
    end

    match '/', :to => 'dashboard#index', :as => "home"

    resources :roles
  end

  devise_for :pagodite_users, :path => 'pagodite', :controllers => { :sessions => "pagodite/sessions" }
end