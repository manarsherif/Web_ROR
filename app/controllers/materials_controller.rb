class MaterialsController < ApplicationController
 
  def index
    @materials = Material.all
  end

  def new
    @resume = Material.new
  end

  def create
    @material = Material.new(material_params)

    if @material.save
      redirect_to materials_path, notice: "The material #{@material.name} has been uploaded."
    else
      render "new"
    end
  end

  def destroy
    @material = Material.find(params[:id])
    @material.destroy
    redirect_to materials_path, notice:  "The material #{@material.name} has been deleted."
  end

private
  def material_params
    params.require(:material).permit(:name, :attachment)
  end

end
