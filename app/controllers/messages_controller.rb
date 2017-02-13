class MessagesController < ApplicationController
  before_action :authenticate_user!

  def new
    @message = Message.new
  end

  def create
    @message = current_user.messages.new(messages_params)
    @message.category = Category.find(params[:category_id])

    if(@message.save)
      redirect_to @message.category
    end
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy

    redirect_to @message.category
  end

  private def messages_params
    params.require(:message).permit(:content)
  end
end
