require 'generators/active_record/devise_generator'
require 'generators/pagodite/orm_helpers'

module ActiveRecord
  module Generators
    class PagoditeGenerator < ActiveRecord::Generators::DeviseGenerator
      argument :model_name, :type => :string, :default => 'pagodite_user'

      include Pagodite::Generators::OrmHelpers
      source_root File.expand_path("../templates", __FILE__)

      def inject_devise_content; end

      def inject_pagodite_content
        inject_into_class model_path, class_name, model_contents + <<-CONTENT
  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :email, :password, :password_confirmation, :remember_me

  alias_attribute :name, :username  

  has_and_belongs_to_many :roles
CONTENT
      end
    end
  end
end