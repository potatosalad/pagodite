module Pagodite
  module Generators
    class InstallGenerator < Rails::Generators::Base
      argument :model_name, :type => :string, :default => 'pagodite_user'

      desc "Runs 'devise:install' and 'pagodite MODEL_NAME' (default MODEL_NAME is 'pagodite_user')."

      def install_devise
        invoke 'devise:install'
        invoke 'pagodite', [model_name]
      end
    end
  end
end