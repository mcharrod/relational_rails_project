class BogFrogsController < ApplicationController
  def index
    @bog = Bog.find(params[:id])
    @bog_frogs = @bog.frogs
  end

  def new
    @bog = Bog.find(params[:id])
  end

  def create
    bog = Bog.find(params[:id])
    frog = bog.frogs.new(frog_params)
    frog.save
      redirect_to "/bogs/#{bog.id}/frogs"
  end

  private
  def frog_params
    params.permit(:name, :age, :singing)
  end
end
