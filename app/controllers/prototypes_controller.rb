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
    @prototypes = Prototype.where(prefecture_id: params[:prefecture_id])
  end

  def destroy
    prototype = Prototype.find(params[:id])
    prototype.destroy
  end

  def edit
    @prototype = Prototype.find(params[:id])
  end

  def update
    prototype = Prototype.find(params[:id])
    prototype.update(prototype_params)
  end

  private

  def prototype_params
    params.require(:prototype).permit(:title, :image, :prefecture_id)
  end

  def prefecture_params
    params.require(:prototype).permit(:prefecture_id)
  end

end
