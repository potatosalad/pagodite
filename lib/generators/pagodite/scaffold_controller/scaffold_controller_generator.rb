require 'rails/generators/rails/scaffold_controller/scaffold_controller_generator'
require 'generators/pagodite/actions'

module Pagodite
  module Generators
    class ScaffoldControllerGenerator < Rails::Generators::ScaffoldControllerGenerator
      source_root File.expand_path("../templates", __FILE__)
      remove_hook_for :template_engine, :test_framework, :helper

      hook_for :template_engine, :test_framework, :as => :pagodite_scaffold
      hook_for :helper, :as => :pagodite do |invoked|
        invoke invoked, [ controller_name ]
      end

      def create_pagodite_controller_files
        template 'pagodite_controller.rb', File.join('app/controllers/pagodite', class_path, "#{controller_file_name}_controller.rb")
      end
    end
  end
end