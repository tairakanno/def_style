class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :search]
  before_action :search_item, only: [:index, :search]
  def index
    @items = Item.all
  end
  def new
    @item = Item.new
  end
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to action: :index
    else
      render action: :new
    end
  end
  def show
    @item = Item.find(params[:id])
    @item_comment = ItemComment.new
    @item_comments = @item.item_comments.includes(:user)
  end
  def edit
    @item = Item.find(params[:id])
  end
  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to action: :index
    else
      render action: :edit
    end
  end
  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to action: :index
  end
  def search
    @results = @p.result.includes(:user).order("created_at DESC")  # 検索条件にマッチした商品の情報を取得
  end

  
  private
    def item_params
      params.require(:item).permit(:name, :text, :days_to_ship_id, :image, :price).merge(user_id: current_user.id)
    end
    def search_item
      @p = Item.ransack(params[:q])  # 検索オブジェクトを生成
    end
end
