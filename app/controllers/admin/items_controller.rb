class Admin::ItemsController < ApplicationController
  # before_action :authenticate_admin!

# 商品新規登録フォーム
  def new
    @item = Item.new
  end

# 商品データ登録処理
  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to admin_item_path
  end

# 商品一覧
  def index
  end

# 商品詳細
  def show
    @item = Item.find(params[:id])
  end

# 商品編集フォーム
  def edit
  end

# 商品データ更新処理
  def update

  end
  
  private
  
  def item_params
    params.require(:item).permit(:name, :kind, :size, :length, :color, :detail, :price, :is_active)
  end
  
end
