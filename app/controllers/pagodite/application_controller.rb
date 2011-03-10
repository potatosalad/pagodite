module Pagodite
  class ApplicationController < ::ApplicationController
    before_filter :_authenticate!
    before_filter :_authorize!

    helper :_current_user

  private
    def _authenticate!
      instance_eval &Pagodite.authenticate_with
    end

    def _authorize!
      instance_eval &Pagodite.authorize_with
    end

    def _current_user
      instance_eval &Pagodite.current_user_method
    end
  end
end