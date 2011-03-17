require 'rails/generators/rails/controller/controller_generator'
require 'generators/pagodite/actions'

module Pagodite
  module Generators
    class ControllerGenerator < Rails::Generators::ControllerGenerator
      source_root File.expand_path("../templates", __FILE__)
      class_option :routes, :type => :boolean, :default => true

      include Pagodite::Generators::Actions

      def initialize(*args) #:nodoc:
        super
        self.name = self.name.insert(0,"Pagodite::") if not self.name.match(/^Pagodite::.*$/)
        assign_names!(name)
      end

      def add_routes
        if options[:routes] == true
          actions.reverse.each do |action|
            pagodite_route %{get "#{file_name}/#{action}"}
          end
        end
      end
    end
  end
end