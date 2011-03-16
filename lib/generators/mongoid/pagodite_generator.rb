require 'generators/mongoid/devise_generator'
require 'generators/pagodite/orm_helpers'

module Mongoid
  module Generators
    class PagoditeGenerator < Mongoid::Generators::DeviseGenerator
      argument :model_name, :type => :string, :default => 'pagodite_user'

      include Pagodite::Generators::OrmHelpers

      def inject_devise_content
        inject_into_file(model_path, model_contents + <<CONTENTS, :after => "include Mongoid::Document\n")
  field :username

  validates_presence_of :username
  validates_uniqueness_of :username, :case_sensitive => false
  attr_accessible :username, :email, :password, :password_confirmation
  alias_attribute :name, :username
  alias_attribute :column_names, :fields
CONTENTS
      end

      def inject_pagodite_content
        in_root do
          append_file('db/seeds.rb', <<CONTENTS)
admin = PagoditeUser.create(:username => 'admin', :password => 'password')
admin.save
CONTENTS
        end
      end
    end
  end
end