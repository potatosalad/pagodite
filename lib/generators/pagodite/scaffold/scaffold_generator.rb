require 'rails/generators/rails/scaffold/scaffold_generator'
require 'generators/pagodite/actions'

module Pagodite
  module Generators
    class ScaffoldGenerator < Rails::Generators::ScaffoldGenerator
      source_root File.expand_path("../templates", __FILE__)
      remove_hook_for :scaffold_controller
      remove_class_option :actions

      hook_for :scaffold_controller, :in => :pagodite, :required => true

      include Pagodite::Generators::Actions

      def add_pagodite_route
        pagodite_route nested_route_config(:indent => 2).join("\n")
      end

      # override the rails method, this provides for much prettier nesting
      def add_resource_route
        route_config = "resources :#{file_name.pluralize}, :only => [:index, :show]"
        route nested_route_config(:indent => 1, :route => route_config).join("\n")
      end

    private
      def nested_route_config(options = {})
        options.reverse_merge!(:indent => 0, :route => "resources :#{file_name.pluralize}")

        route_config = Array.new
        class_path.each_with_index do |namespace,i|
          route_config << "#{'  ' * i}namespace :#{namespace} do"
        end
        route_config << "#{'  ' * class_path.length}#{options[:route]}"
        (0..(class_path.size - 1)).to_a.reverse.each do |i|
          route_config << "#{'  ' * i}end"
        end
        first_route = route_config.shift
        return route_config.map { |x| ('  ' * options[:indent])+x }.unshift(first_route)
      end
    end
  end
end