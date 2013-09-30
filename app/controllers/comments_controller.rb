class CommentsController < ApplicationController

  # GET /comments/new
  # GET /comments/new.json
  def new
    @comment = Comment.new
    @comment.user = current_user

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @comment }
    end
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(params[:comment])
    @comment.user = current_user
    @comment.event_id = params[:event_id]

    respond_to do |format|
      if @comment.save
        msg = t('created_x.male', model: Comment.model_name.human)
        format.html { redirect_to @comment.event, notice: msg }
        format.json { render json: @comment, status: :created, location: @comment }
      else
        format.html {
          @comments = Comment.latest
          render action: "new"
        }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to comments_url }
      format.json { head :ok }
    end
  end
end
