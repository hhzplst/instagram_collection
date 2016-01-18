class CollectionsController < ApplicationController
  def index
    @collections = Collection.all
  end

  def new
  end

  def create
  end

end
