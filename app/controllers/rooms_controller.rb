class RoomsController < ApplicationController
  before_action :authenticate_user!
  # before_action :move_to_root_path, only: [:show]
  def create
    @room = Room.create
    @entry1 = Entry.create(:room_id => @room.id, :user_id => current_user.id)
    @entry2 = Entry.create(params.require(:entry).permit(:user_id, :room_id).merge(:room_id => @room.id))
    redirect_to "/rooms/#{@room.id}"
  end

  def show
    @room = Room.find(params[:id])
    if Entry.where(:user_id => current_user.id, :room_id => @room.id).present?
      @messages = @room.messages
      @message = Message.new
      @entries = @room.entries
    else
      redirect_back(fallback_location: root_path)
    end
  end
  private
  def move_to_root_path
    if user_signed_in? && current_user.id == @room.entries.user_id
      redirect_to root_path
    end
  end
end
