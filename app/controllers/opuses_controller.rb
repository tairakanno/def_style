class OpusesController < ApplicationController
  def index
    @opuses = Opus.all
  end
  def new
    @opus = Opus.new
  end
  def create
    @opus = Opus.new(opus_params)
    if @opus.valid?
      @opus.save
      redirect_to root_path
    else
      render "new"
    end
  end

  private
  def opus_params
    params.require(:opus).permit(:title, :description).merge(user_id: current_user.id)
  end
end
