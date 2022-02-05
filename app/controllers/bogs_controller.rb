class BogsController < ApplicationController
  def index
    @bogs = Bog.all
  end

  def show
    @bog = Bog.find(params[:id])
  end

  def new
    @bog = Bog.new
  end


  def create
    @bog = Bog.new(bog_params)
    if @bog.save
      redirect_to '/bogs'
    else
      flash.now[:error] = 'Bog not created: Missing required information'
      render :new
    end
  end
  # 
  # def create
  #   @bog = Bog.new(bog_params)
  #   redirect_to('/bogs')
  # end

  private
  def bog_params
    params.permit(:name, :ph, :radioactive)
  end
end
