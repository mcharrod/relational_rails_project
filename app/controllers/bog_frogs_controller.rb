class BogFrogsController < ApplicationController
  def index
      @bog = Bog.find(params[:id])
    # if the user inputs an age
    if (params[:age])
      @bog_frogs = @bog.frogs_of_age(params[:age])
    # if the user clicks alphabetize frogs
    elsif (params[:sort])
      @bog_frogs = @bog.alphabetized_frogs
    elsif
      @bog_frogs = @bog.frogs
    end
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
