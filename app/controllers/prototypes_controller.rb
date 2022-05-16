class PrototypesController < ApplicationController
  
  def index
    @prototypes = Prototype.all
  end

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @prototypes = Prototype.all
  end

  private

  def prototype_params
    params.require(:prototype).permit(:title, :image, :prefecture_id)
  end

end
