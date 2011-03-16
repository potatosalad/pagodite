class Pagodite::SessionsController < Devise::SessionsController
  def root_path
    pagodite_home_url
  end
end