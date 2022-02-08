class FrogsController < ApplicationController
  def index
    @frogs = Frog.all
  end

  def show
    @froge = Frog.find(params[:id])
  end

  def edit
    @froge = Frog.find(params[:id])
  end

  def update
    frog = Frog.find(params[:id])
    frog.update(frog_params)
    redirect_to("/frogs/#{frog.id}")
  end

  def destroy
    frog = Frog.find(params[:id])
    frog.destroy
    redirect_to("/frogs")
  end

  private
     def frog_params
       params.permit(:name, :age, :singing)
     end
end
