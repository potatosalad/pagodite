module Pagodite
  class InstallMigrationsGenerator < Rails::Generators::Base
    include Rails::Generators::Migration
    source_root File.expand_path('../templates', __FILE__)

    def create_migration_file
      migration_template 'migration.rb', 'db/migrate/'
    end
  end
end