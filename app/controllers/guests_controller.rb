class GuestsController < ApplicationController
  # GET /guests
  # GET /guests.json
  def index
    @guests = Guest.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @guests }
    end
  end

  def confirm
    guest = Guest.find(params[:id])
    guest.belongs_to! current_user
    guest.coming = true

    if(guest.save)
    then  redirect_to guest.event, notice: t('tert.guest.Confirmed')
    else  redirect_to  guest.event, notice: t('tert.guest.ConfirmFailed')
    end
  end

  def cancel
    guest = Guest.find(params[:id])
    guest.belongs_to! current_user
    guest.coming = false

    if(guest.save)
    then  redirect_to  guest.event, notice: t('tert.guest.Cancelled')
    else  redirect_to  guest.event, notice: t('tert.guest.CancelFailed')
    end
  end

  # GET /guests/1
  # GET /guests/1.json
  def show
    @guest = Guest.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @guest }
    end
  end

  # GET /guests/new
  # GET /guests/new.json
  def new
    @guest = Guest.new
    @guest.user = current_user

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @guest }
    end
  end

  # POST /guests
  # POST /guests.json
  def create
    @guest = Guest.new(params[:guest])
	  @guest.user = current_user
    @guest.event_id = params[:event_id]

    respond_to do |format|
      if @guest.save
        format.html { redirect_to  @guest.event, notice: 'Guest was successfully created.' }
        format.json { render json: @guest, status: :created, location: @guest }
      else
        format.html { render action: "new" }
        format.json { render json: @guest.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /guests/1
  # PUT /guests/1.json
  def update
    @guest = Guest.find(params[:id])

    respond_to do |format|
      if @guest.update_attributes(params[:guest])
        format.html { redirect_to @guest, notice: 'Guest was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @guest.errors, status: :unprocessable_entity }
      end
    end
  end
end
