require 'rails/generators/rails/helper/helper_generator'

module Pagodite
  module Generators
    class HelperGenerator < Rails::Generators::HelperGenerator
      source_root File.expand_path("../templates", __FILE__)
      remove_hook_for :test_framework
      check_class_collision :prefix => "Pagodite::", :suffix => "Helper"

      def create_pagodite_helper_files
        template 'pagodite_helper.rb', File.join('app/helpers/pagodite', class_path, "#{file_name}_helper.rb")
      end

      hook_for :test_framework, :as => :pagodite_helper
    end
  end
end