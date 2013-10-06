class ContributionTypesController < ApplicationController
  def index
    @contribution_types = ContributionType.all
    @contribution_type = ContributionType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @contribution_types }
    end
  end

  def edit
    @contribution_type = ContributionType.find params[:id]

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @contribution_type }
    end
  end

  def update
    @contribution_type = ContributionType.find(params[:id])

    respond_to do |format|
      if @contribution_type.update_attributes(params[:contribution_type])
        msg = t :updated_x, model: ContributionType.model_name.human
        format.html { redirect_to contribution_types_path, notice: msg }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @contribution_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /contributions
  # POST /contributions.json
  def create
    @contribution_type = ContributionType.new(params[:contribution_type])

    respond_to do |format|
      if @contribution_type.save
        msg = t('created_x.male', model: ContributionType.model_name.human)
        format.html { redirect_to contribution_types_path, notice: msg }
        format.json { render json: @contribution_type, status: :created, location: @contribution_type }
      else
        format.html {
          @contribution_types = ContributionType.all
          render action: "index"
        }
        format.json { render json: @contribution_type.errors, status: :unprocessable_entity }
      end
    end
  end
end
