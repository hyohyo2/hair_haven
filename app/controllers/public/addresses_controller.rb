class Public::AddressesController < ApplicationController
  before_action :authenticate_user!

  # 配送先登録フォーム/一覧
  def index
    @address = Address.new
    @addresses = current_user.addresses.where(user_id: current_user.id)
  end

  # 配送先の登録処理
  def create
    @address = current_user.addresses.new(address_params)
    if @address.save
      flash[:notice] = "配送先の登録しました。"
      redirect_to addresses_path
    else
      flash.now[:alert] = "配送先の登録に失敗しました。"
      @addresses = current_user.addresses.where(user_id: current_user.id)
      render :index
    end
  end

  # 配送先の編集フォーム
  def edit
    @address = Address.find(params[:id])
  end

  # 配送先の更新処理
  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
      flash[:notice] = "配送先の情報を変更しました。"
      redirect_to addresses_path
    else
      flash.now[:alert] = "配送先の情報変更に失敗しました。"
      render :edit
    end
  end

  # 配送先のデータ削除処理
  def destroy
    @address = Address.find(params[:id])
    if @address.destroy
      flash[:notice] = "配送先情報を削除しました。"
      redirect_to addresses_path
    else
      flash.now[:alert] = "配送先情報の削除に失敗しました。"
      render :index
    end
  end

  private

  def address_params
    params.require(:address).permit(:post_code, :address, :name)
  end

end
