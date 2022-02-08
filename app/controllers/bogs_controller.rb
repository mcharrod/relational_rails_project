class BogsController < ApplicationController
  def index
    @bogs = Bog.all
  end

  def show
    @bog = Bog.find(params[:id])
  end

  def new
  end

  def create
    bog = Bog.new(bog_params)
    bog.save
      redirect_to '/bogs'
  end

  def destroy
    bog = Bog.find(params[:id])
    bog.destroy
    redirect_to('/bogs')
  end

  private
  def bog_params
    params.permit(:name, :ph, :radioactive)
  end
end
