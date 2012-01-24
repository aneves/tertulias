class HomeController < ApplicationController
  # GET /home
  def index
    @guests = Guest.all
    @contribs = Contribution.all
    @comments = Comment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @guests }
    end
  end
  
  def login
	@user = User.new
  end
end
