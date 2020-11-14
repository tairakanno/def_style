class OpusesController < ApplicationController
  before_action :search_product, only: [:index, :search]
  def index
    @opuses = Opus.includes(:user).order("created_at DESC")
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
  def search
    @results = @p.result.includes(:user).order("created_at DESC")
  end
  def destroy
    @opus = Opus.find(params[:id])
    if @opus.user.id == current_user.id
      @opus.destroy
      redirect_to root_path
    else
      render action: :show
    end
  end

  private
  def opus_params
    params.require(:opus).permit(:title, :description, :image, :youtube_url).merge(user_id: current_user.id)
  end
  def search_product
    @p = Opus.ransack(params[:q])  # 検索オブジェクトを生成
  end
  
end
