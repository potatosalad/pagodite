require 'rails/generators/erb/scaffold/scaffold_generator'

module Erb
  module Generators
    class PagoditeScaffoldGenerator < Erb::Generators::ScaffoldGenerator
      source_root File.expand_path("../templates", __FILE__)

      def create_pagodite_root_folder
        empty_directory File.join("app/views/pagodite", controller_file_path)
      end

      def copy_pagodite_view_files
        available_pagodite_views.each do |view|
          filename = filename_with_extensions(view)
          template File.join("pagodite", filename), File.join("app/views/pagodite", controller_file_path, filename)
        end
      end

    protected
      def available_views
        %w(index show)
      end

      def available_pagodite_views
        %w(index edit show new _form)
      end
    end
  end
end
