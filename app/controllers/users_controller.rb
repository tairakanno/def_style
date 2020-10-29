class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @opuses = @user.opuses
  end
end
