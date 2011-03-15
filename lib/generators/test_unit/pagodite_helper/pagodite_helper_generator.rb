require 'rails/generators/test_unit/helper/helper_generator'

module TestUnit
  module Generators
    class PagoditeHelperGenerator < TestUnit::Generators::HelperGenerator
      source_root File.expand_path("../templates", __FILE__)
      check_class_collision :prefix => "Pagodite::", :suffix => "HelperTest"

      def create_pagodite_helper_files
        template 'pagodite_helper_test.rb', File.join('test/unit/helpers/pagodite', class_path, "#{file_name}_helper_test.rb")
      end
    end
  end
end