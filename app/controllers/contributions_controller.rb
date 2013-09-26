class ContributionsController < ApplicationController
  # GET /contributions
  # GET /contributions.json
  def index
    @contributions = Contribution.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @contributions }
    end
  end

  def confirm
    contrib = Contribution.find(params[:id])
    contrib.belongs_to! current_user
    contrib.removed = false

    if(contrib.save)
    then  redirect_to contrib.event, notice: 'contribution was confirmed.'
    else  redirect_to  contrib.event, notice: 'Error confirming contribution.' 
    end
  end

  def cancel
    contrib = Contribution.find(params[:id])
    contrib.belongs_to! current_user
    contrib.removed = true

    if(contrib.save)
    then  redirect_to  contrib.event, notice: 'Contribution cancelled.' 
    else  redirect_to  contrib.event, notice: 'Error cancelling contribution.' 
    end
  end

  # GET /contributions/1
  # GET /contributions/1.json
  def show
    @contribution = Contribution.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @contribution }
    end
  end

  # GET /contributions/new
  # GET /contributions/new.json
  def new
    @contribution = Contribution.new
    @contribution.user = current_user

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @contribution }
    end
  end

  # GET /contributions/1/edit
  def edit
    @contribution = Contribution.find(params[:id])
  end

  # POST /contributions
  # POST /contributions.json
  def create
    @contribution = Contribution.new(params[:contribution])
    @contribution.user = current_user
    @contribution.event_id = params[:event_id]

    respond_to do |format|
      if @contribution.save
        format.html { redirect_to @contribution.event, notice: 'Contribution was successfully created.' }
        format.json { render json: @contribution, status: :created, location: @contribution }
      else
        format.html { render action: "new" }
        format.json { render json: @contribution.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /contributions/1
  # PUT /contributions/1.json
  def update
    @contribution = Contribution.find(params[:id])

    respond_to do |format|
      if @contribution.update_attributes(params[:contribution])
        format.html { redirect_to @contribution, notice: 'Contribution was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @contribution.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contributions/1
  # DELETE /contributions/1.json
  def destroy
    @contribution = Contribution.find(params[:id])
    @contribution.destroy

    respond_to do |format|
      format.html { redirect_to contributions_url }
      format.json { head :ok }
    end
  end
end
