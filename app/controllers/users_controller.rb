class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @opuses = @user.opuses.order("created_at DESC")
    @currentUserEntry=Entry.where(user_id: current_user.id)
    @userEntry=Entry.where(user_id: @user.id)
    if @user.id == current_user.id
    else
      @currentUserEntry.each do |cu|
        @userEntry.each do |u|
          if cu.room_id == u.room_id then
            @isRoom = true
            @roomId = cu.room_id
          end
        end
      end
      if @isRoom
      else
        @room = Room.new
        @entry = Entry.new
      end
    end
  end
  def edit
    @user = User.find(params[:id])
  end
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to action: :show
    else
      render "edit"
    end  
  end
  def destroy
    @user = User.find(params[:opus_id])
    if @user.destroy
      redirect_to new_user_registration_path
    else
      renser action: :show
    end
  end


  private
  def user_params
    params.require(:user).permit(:nickname, :prefecture_id, :genre_id, :profile, :image)
  end
  
end
