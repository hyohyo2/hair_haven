class Public::TagsController < ApplicationController

  # タグ一覧
  def index
    @tags = Tag.all
  end

  def item_index
    @tag = Tag.find(params[:id])
    @items = @tag.items
  end
end
