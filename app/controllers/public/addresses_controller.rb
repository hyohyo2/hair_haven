class Public::AddressesController < ApplicationController
  # before_action :authenticate_user!

  # 配送先登録フォーム/一覧
  def index
    @address = Address.new
    @addresses = Address.all
  end

  # 配送先の登録処理
  def create
    @address = Address.new(address_params)
    if @address.save
      flash[:notice] = "配送先の登録しました。"
      redirect_to addresses_path
    else
      flash.now[:alert] = "配送先の登録に失敗しました。"
      @addresses = Address.all
      render :index
    end
  end

  # 配送先の編集フォーム
  def edit
  end

  # 配送先の更新処理
  def update

  end

  # 配送先のデータ削除処理
  def destroy

  end

  private

  def address_params
    params.require(:address).permit(:post_code, :address, :name)
  end

end
