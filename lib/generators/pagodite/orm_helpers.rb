module Pagodite
  module Generators
    module OrmHelpers
      def model_contents
<<-CONTENT
  # Include default devise modules. Others available are:
  # :registerable, :validatable,
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :rememberable, :trackable, :recoverable, :authentication_keys => [ :username ]

CONTENT
      end
    end
  end
end