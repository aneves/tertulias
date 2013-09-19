class ContributionTypesController < ApplicationController
  # GET /contributions/new
  # GET /contributions/new.json
  def new
    @contribution_type = ContributionType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @contribution_type }
    end
  end

  # POST /contributions
  # POST /contributions.json
  def create
    @contribution_type = ContributionType.new(params[:contribution_type])

    respond_to do |format|
      if @contribution_type.save
        format.html { redirect_to :root, notice: 'Contribution type was successfully created.' }
        format.json { render json: @contribution_type, status: :created, location: @contribution_type }
      else
        format.html { render action: "new" }
        format.json { render json: @contribution_type.errors, status: :unprocessable_entity }
      end
    end
  end
end
