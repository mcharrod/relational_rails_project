class BogsController < ApplicationController
  def index
    @bogs = Bog.all
  end
end
