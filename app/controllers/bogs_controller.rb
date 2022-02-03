class BogsController < ApplicationController
  def index
    @bogs = Bog.all
  end

  def show
    @bog = Bog.find(params[:id])
  end
end
