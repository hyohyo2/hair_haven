class Admin::SearchesController < ApplicationController
  before_action :authenticate_admin!
  def form
  end

  def result
  end
end
