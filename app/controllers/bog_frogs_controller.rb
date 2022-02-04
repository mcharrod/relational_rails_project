class BogFrogsController < ApplicationController
  def index
    @bog = Bog.find(params[:id])
    @bog_frogs = @bog.frogs
  end
end
