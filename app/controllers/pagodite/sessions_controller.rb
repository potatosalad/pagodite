class Pagodite::SessionsController < Devise::SessionsController
  layout "pagodite_login"

  def root_path
    pagodite_home_url
  end
end