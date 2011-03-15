require 'rails/generators/test_unit/scaffold/scaffold_generator'

module TestUnit
  module Generators
    class PagoditeScaffoldGenerator < TestUnit::Generators::ScaffoldGenerator
      source_root File.expand_path("../templates", __FILE__)

      def create_pagodite_test_files
        template 'pagodite_functional_test.rb',
                 File.join('test/functional/pagodite', controller_class_path, "#{controller_file_name}_controller_test.rb")
      end
    end
  end
end