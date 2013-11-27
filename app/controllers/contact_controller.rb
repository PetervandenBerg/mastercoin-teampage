class ContactController < ApplicationController

  def new
    @message = Mailermessage.new
  end

  def create   
    @message = Mailermessage.new(params[:mailermessage])
    
    if @message.valid?
      NotificationsMailer.new_message(@message).deliver
      redirect_to(contact_path, :notice => "Message has succesfully been sent")
    else
      flash.now.alert = "Please fill in all fields."
      render :new
    end
  end

end