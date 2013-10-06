class EventsController < ApplicationController
  # GET /events
  # GET /events.json
  def index
    @events = Event.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @events }
    end
  end

  def next
    # TODO/FIXME: use Event.where(["when >= ?", DateTime.now]).first
    # SQLite seems to be exploding whenever I try to select this column.
    event = Event.first
    if event != nil
      then redirect_to event
    else redirect_to new_event_path
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event = Event.find(params[:id])

    @guests = @event.guests
    @contributions = @event.contributions
    @comments = @event.comments.sort_by(&:created_at).reverse
    @new_comment = Comment.new
    @new_guest = Guest.new
    @new_contribution = Contribution.new

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/new
  # GET /events/new.json
  def new
    @event = Event.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event }
    end
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(params[:event])
    @event.owner = current_user

    respond_to do |format|
      if @event.save
        msg = t('created_x.male', model: Event.model_name.human)
        format.html { redirect_to @event, notice: msg }
        format.json { render json: @event, status: :created, location: @event }
      else
        format.html { render action: "new" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
    @event.belongs_to! current_user
  end

  # PUT /events/1
  # PUT /events/1.json
  def update
    @event = Event.find(params[:id])
    @event.belongs_to! current_user

    respond_to do |format|
      if @event.update_attributes(params[:event])
        msg = t :updated_x, model: Event.model_name.human
        format.html { redirect_to @event, notice: msg }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end
end
