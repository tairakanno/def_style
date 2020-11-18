class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :opus_params, except: [:index]

  def create
    like = Like.create(user_id: current_user.id, opus_id: params[:id])

  end
  def destroy
    Like.find_by(user_id: current_user.id, opus_id: params[:id]).destroy
  end
  def index
    user = User.find(params[:user_id])
    @likes = user.like_opuses
  end

  private
  def like_params
    params.require(:like).merge(user_id: current_user.id, opus_id: params[:id])
  end
  def opus_params
    @opus = Opus.find(params[:id])
  end
end
