class Admin::NoticeGenresController < ApplicationController
  before_action :authenticate_admin!

  # 情報ジャンル登録フォーム/一覧
  def index
    @notice_genre = NoticeGenre.new
    @notice_genres = NoticeGenre.all
  end

  # 情報ジャンルデータ登録処理
  def create
    @notice_genre = NoticeGenre.new(notice_genre_params)
    if @notice_genre.save
      flash[:notice] = "情報ジャンルを登録しました。"
      redirect_to admin_notice_genres_path
    else
      flash.now[:alert] = "情報ジャンルを登録できませんでした。"
      @notice_genres = NoticeGenre.all
      render :index
    end
  end

  # 情報ジャンル編集フォーム
  def edit
    @notice_genre = NoticeGenre.find(params[:id])
  end

  # 情報ジャンルデータ更新処理
  def update
    @notice_genre = NoticeGenre.find(params[:id])
    if @notice_genre.update(notice_genre_params)
      flash[:notice] = "お知らせジャンル名を変更しました。"
      redirect_to admin_notice_genres_path
    else
      flash.now[:alert] = "お知らせジャンル名を変更できませんでした。"
      render :edit
    end
  end

  def destroy
    @notice_genre = NoticeGenre.find(params[:id])
    if @notice_genre.destroy
      flash[:notice] = "お知らせジャンルを削除しました。"
      redirect_to request.referer
    else
      flash.now[:alert] = "お知らせジャンルの削除に失敗しました。"
      @notice_genres = NoticeGenre.all
      render :index
    end
  end

  private
  def notice_genre_params
    params.require(:notice_genre).permit(:name)
  end

end
