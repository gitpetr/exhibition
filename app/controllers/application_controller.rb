class ApplicationController < ActionController::Base
  def after_sign_in_path_for(_admin)
    admin_dashboards_show_path
  end
end
