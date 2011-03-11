module Pagodite
  module Generators
    class PagoditeGenerator < Rails::Generators::NamedBase
      namespace "pagodite"
      source_root File.expand_path("../templates", __FILE__)

      hook_for :orm

      def add_pagodite_routes
        route <<-CONTENTS
namespace :pagodite do
    resources :#{table_name}, :except => [:edit, :update]

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

  devise_for :#{table_name}, :path => 'pagodite', :controllers => { :sessions => "pagodite/sessions" }
CONTENTS
      end
    end
  end
end