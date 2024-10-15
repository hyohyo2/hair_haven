class Admin::SearchesController < ApplicationController
  before_action :authenticate_admin!
  def search
  end

  def result
    @model = params[:model]
    @content = params[:content]
    
    if @model == "item"
      @records = Item.admin_search_for(@content)
    elsif @model == "notice"
      @records = Notice.search_for(@content)
    else
      @records = User.admin_search_for(@content)
    end
  end
end
