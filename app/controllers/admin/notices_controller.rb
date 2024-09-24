class Admin::NoticesController < ApplicationController
  before_action :authenticate_admin!

  # お知らせ登録フォーム
  def new
    @notice = Notice.new
  end

  # お知らせデータ登録処理
  def create
    @notice = Notice.new(notice_params)
    if @notice.save
      flash[:notice] = "お知らせを登録しました。"
      redirect_to admin_notice_path(@notice.id)
    else
      flash.now[:alert] = "お知らせの登録に失敗しました。"
      render :new
    end
  end

  # お知らせ一覧
  def index
    @notices = Notice.all
  end

  # お知らせ詳細
  def show
    @notice = Notice.find(params[:id])
  end

  # お知らせ編集フォーム
  def edit
    @notice = Notice.find(params[:id])
  end

  # お知らせデータ更新処理
  def update
    @notice = Notice.find(params[:id])
    if @notice.update(notice_params)
      flash[:notice] = "お知らせの内容を変更しました。"
      redirect_to admin_notice_path(@notice)
    else
      flash.now[:alert] = "お知らせの内容の変更に失敗しました。"
      render :edit
    end
  end

  # お知らせデータ削除処理
  def destroy
    @notice = Notice.find(params[:id])
    if @notice.destroy
      flash[:notice] = "お知らせを削除しました。"
      redirect_to admin_notices_path
    else
      flash.now[:alert] = "お知らせの削除に失敗しました。"
      @notice = Notice.find(params[:id])
      render :show
    end
  end

  private

  def notice_params
    params.require(:notice).permit(:title, :detail, :notice_genre_id)
  end

end
