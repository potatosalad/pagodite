module Pagodite
  module Generators
    class InstallGenerator < Rails::Generators::Base
      argument :model_name, :type => :string, :default => 'pagodite_user'

      def check_for_devise_models
        # File.exists?
        devise_path =  FileUtils.pwd + "/config/initializers/devise.rb"

        if File.exists?(devise_path)
          parse_route_files
        else
          puts "Looks like you don't have devise install! We'll install it for you!"
          invoke 'devise:install'
          set_devise
        end
      end

      def set_devise
        puts "Setting up devise for you!", "======================================================"
        invoke 'devise', [model_name]
      end
    end
  end
end