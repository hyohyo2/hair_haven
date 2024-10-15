class Public::SearchesController < ApplicationController
  def search

  end

  def result
    @model = params[:model]
    @content = params[:content]

    if @model == "item"
      @records = Item.search_for(@content)
    else
      @records = Notice.search_for(@content)
    end
  end
end
