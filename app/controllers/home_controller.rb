class HomeController < ApplicationController
  # GET /home
  def index
    @guests = Guest.all
    @contributions = Contribution.all
    @comments = Comment.latest
    @new_comment = Comment.new
    @new_guest = Guest.new

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @guests }
    end
  end
  
  def login
	@user = User.new
  end
end
