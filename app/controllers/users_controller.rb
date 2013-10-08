class UsersController < ApplicationController
  before_filter :admins_only!, except: :usurp_admin

  # GET /users
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { raise }
    end
  end

  def usurp_admin
    if  current_user.admin?
    then redirect_to users_path, notice: t('tert.alreadyAdmin')
         return
    end

    admins = User.where(admin: true)
    if  admins.any?
         redirect_to (Event.last || new_event_path), notice: t("tert.adminsExist")
         return
    end
    current_user.admin = true
    current_user.save!
    redirect_to users_path, notice: t("tert.usurpedAdmin")
  end

  private
  def admins_only!
    #TODO: message not showing because of redirect...
    redirect_to Event.last, alert: t("tert.AdminsOnly") unless current_user.admin?
  end
end
