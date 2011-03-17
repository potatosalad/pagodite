module Pagodite
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../templates", __FILE__)
      argument :model_name, :type => :string, :default => 'pagodite_user'

      desc "Runs 'devise:install' and 'pagodite:devise MODEL_NAME' (default MODEL_NAME is 'pagodite_user')."

      def install_devise
        invoke 'devise:install'
        invoke 'pagodite:devise', [model_name]
      end

      def create_controller_files
        available_controllers.each do |controller|
          @controller = controller.to_s
          filename = "#{@controller}_controller.rb"
          @path = File.join("app/controllers/pagodite", filename)
          template filename, @path
        end
      end

      hook_for :template_engine, :as => :pagodite_install

    protected
      def available_controllers
        %w(dashboard)
      end
    end
  end
end