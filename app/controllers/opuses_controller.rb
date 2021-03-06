class OpusesController < ApplicationController
  def index
    @opuses = Opus.order("created_at DESC")
  end

  def new
    @opus = Opus.new
  end

  def create
    @opus = Opus.new(opus_params)
    if params[:opus][:youtube_url].present?
      url = params[:opus][:youtube_url]
      url = url.last(11)
      @opus.youtube_url = url
      # redirect_to root_path
    end
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
      redirect_to root_path
    else
      render action: :edit
    end
  end

  def show
    @opus = Opus.find(params[:id])
    @comment = Comment.new
    @comments = @opus.comments.includes(:user)
  end

  private
  def opus_params
    params.require(:opus).permit(:title, :description, :image, :youtube_url).merge(user_id: current_user.id)
  end
end
