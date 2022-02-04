class FrogsController < ApplicationController
  def index
    @frogs = Frog.all
  end

  def show
    @froge = Frog.find(params[:id])
  end
end
