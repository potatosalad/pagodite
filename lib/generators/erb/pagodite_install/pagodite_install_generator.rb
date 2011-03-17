require 'rails/generators/erb'

module Erb
  module Generators
    class PagoditeInstallGenerator < Base
      source_root File.expand_path("../templates", __FILE__)

      remove_argument :name
      def name; "pagodite"; end

      def copy_view_files
        base_path = File.join("app/views", class_path, file_name)
        empty_directory base_path

        available_views.each do |controller, views|
          @controller = controller.to_s
          empty_directory File.join(base_path, @controller)
          views.each do |view|
            filename = filename_with_extensions(view)
            @path = File.join(base_path, @controller, filename)
            template File.join(@controller, filename), @path
          end
        end
      end

    protected
      def available_views
        {
          :dashboard => %w(index)
        }
      end
    end
  end
end
