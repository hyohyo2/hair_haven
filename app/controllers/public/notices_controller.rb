class Public::NoticesController < ApplicationController
  
  # お知らせ一覧
  def index
    @notices = Notice.all
  end

  # お知らせ詳細
  def show
    @notice = Notice.find(params[:id])
  end
end
