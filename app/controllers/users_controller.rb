class UsersController < ApplicationController
  before_filter :admins_only!

  # GET /users
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { raise }
    end
  end

  private
  def admins_only!
    #TODO: message not showing!
  	redirect_to :root, alert: t("tert.AdminsOnly") unless current_user.admin?
  end
end
