class CommentsController < ApplicationController
  def create
    # @comment = Comment.new(text: params[:comment][:text])
    @comment = Comment.new(comment_params)
    if @comment.valid?
      @comment.save
      redirect_to "/opuses/#{@comment.opus.id}"
      # ActionCable.server.broadcast 'comment_channel', content: @comment
    else
      render "opeses/show"
    end
  end
  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, opus_id: params[:opus_id])
  end
end
