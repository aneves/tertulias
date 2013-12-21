class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!
  def after_invite_path_for(resource)
    return users_path if current_user.admin?
    return root_path
  end
end
