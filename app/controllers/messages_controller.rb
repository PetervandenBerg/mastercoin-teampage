class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]
  before_action :set_notification, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!


  def index
    @messages = Message.all
  end

  def show
    @commentable = @message
    @comments = @commentable.comments
    @comment = Comment.new
    @notification.update_attributes(read: true)
  end

  def new
    @message = Message.new
  end

  def edit
  end

  def create
    @message = Message.new(message_params)
    @message.user_id = current_user.id

    respond_to do |format|
      if @message.save
        format.html { redirect_to user_path(current_user), notice: 'Message was successfully created.' }
        format.json { render action: 'show', status: :created, location: @message }
      else
        format.html { render action: 'new' }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @message.update(message_params)
        format.html { redirect_to @message, notice: 'Message was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @message.destroy
    respond_to do |format|
      format.html { redirect_to messages_url }
      format.json { head :no_content }
    end
  end

  private
    def set_message
      @message = Message.find(params[:id])
    end

    def set_notification
      @notification = current_user.notifications.where(message_id: params[:id]).first
    end

    def message_params
      params.require(:message).permit(:title, :description, :user_id, user_ids: [])
    end
end
