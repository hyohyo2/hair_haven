class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!

# 商品新規登録フォーム
  def new
    @item = Item.new
  end

# 商品データ登録処理
  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:notice] = "商品情報を登録しました。"
      redirect_to admin_item_path(@item.id)
    else
      flash.now[:alert] = "商品情報の登録に失敗しました。"
      render :new
    end
  end

# 商品一覧
  def index
    @items = Item.all
    
  end

# 商品詳細
  def show
    @item = Item.find(params[:id])
  end

# 商品編集フォーム
  def edit
    @item = Item.find(params[:id])
  end

# 商品データ更新処理
  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      flash[:notice] = "商品情報を更新しました。"
      redirect_to admin_item_path
    else
      flash.now[:alert] = "商品情報の更新に失敗しました。"
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :kind, :size, :length, :color, :detail, :price, :is_active, :image)
  end

end
