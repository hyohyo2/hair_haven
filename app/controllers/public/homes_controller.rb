class Public::HomesController < ApplicationController

  def top
    # 最新
    @notices = Notice.order('id DESC').limit(3)
  end

  def about
  end
end
