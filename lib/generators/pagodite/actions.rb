module Pagodite
  module Generators
    module Actions
      # Make an entry in Rails routing file config/routes.rb
      # underneath the :pagodite namespace
      #
      # === Example
      #
      #   pagodite_route "resources :products"
      #
      def pagodite_route(routing_code)
        log :p_route, routing_code
        sentinel = /namespace :pagodite.*do?\s*$/

        in_root do
          inject_into_file 'config/routes.rb', "\n    #{routing_code}\n", { :after => sentinel, :verbose => false }
        end
      end
    end
  end
end