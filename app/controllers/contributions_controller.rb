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
    then  redirect_to contrib.event, notice: t('tert.contribution.Confirmed')
    else  redirect_to  contrib.event, notice: t('tert.contribution.ConfirmFailed')
    end
  end

  def cancel
    contrib = Contribution.find(params[:id])
    contrib.belongs_to! current_user

    if(contrib.destroy)
    then  redirect_to  contrib.event, notice: t('tert.contribution.Cancelled')
    else  redirect_to  contrib.event, notice: t('tert.contribution.CancelFailed')
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
    @event = Event.find params[:event_id]

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @contribution }
    end
  end

  # POST /contributions
  # POST /contributions.json
  def create
    @contribution = Contribution.new(params[:contribution])
    @contribution.user = current_user
    @contribution.event_id = params[:event_id]

    respond_to do |format|
      if @contribution.save
        msg = t('created_x.female', model: Contribution.model_name.human)
        format.html { redirect_to @contribution.event, notice: msg }
        format.json { render json: @contribution, status: :created, location: @contribution }
      else
        @event = Event.find params[:event_id]
        format.html { render action: "new" }
        format.json { render json: @contribution.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @contribution = Contribution.find params[:id]
    @contribution.belongs_to! current_user
    @event = Event.find params[:event_id]
  end

  def update
    @contribution = Contribution.find(params[:id])
    @contribution.belongs_to! current_user
    @event = Event.find params[:event_id]

    respond_to do |format|
      if @contribution.update_attributes(params[:contribution])
        msg = t :updated_x, model: Contribution.model_name.human
        format.html { redirect_to event_path(@event), notice: msg }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @contribution.errors, status: :unprocessable_entity }
      end
    end
  end
end
