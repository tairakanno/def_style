class OpusesController < ApplicationController
  def index
    @opuses = Opus.order("created_at DESC")
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
  def edit
    @opus = Opus.find(params[:id])
  end

  def update
    @opus = Opus.find(params[:id])
    if @opus.update(opus_params)
      redirect_to action: :show
    else
      render action: :edit
    end
  end
  def show
    @opus = Opus.find(params[:id])
    @comments = @opus.comments.order("created_at DESC")
    @comment = Comment.new
  end

  private
  def opus_params
    params.require(:opus).permit(:title, :description, :image).merge(user_id: current_user.id)
  end
end
