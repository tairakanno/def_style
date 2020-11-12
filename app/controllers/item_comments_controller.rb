class ItemCommentsController < ApplicationController
  def create
    @item_comment = ItemComment.new(item_comment_params)
    if @item_comment.save
      ActionCable.server.broadcast 'item_comment_channel', content: @item_comment
    end
  end

  private
  def item_comment_params
    params.require(:item_comment).permit(:text).merge(user_id: current_user.id, item_id: params[:item_id])
  end
  
end
