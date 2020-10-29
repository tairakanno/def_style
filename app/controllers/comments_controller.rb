class CommentsController < ApplicationController
  def create
    @message = Message.new(text: params[:message][:text])
  end
end
