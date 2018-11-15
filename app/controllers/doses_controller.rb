class DosesController < ApplicationController

  def create
    @dose = Dose.create(doses_params)
    @cocktail = @dose.cocktail
    redirect_to show_path(@cocktail)
  end

  def destroy
    @dose = Dose.find(params[:id])
    @cocktail = @dose.cocktail
    @dose.destroy
    redirect_to show_path(@cocktail)
  end

  private

  def doses_params
    params.require(:dose).permit(:description, :cocktail_id, :ingredient_id)
  end
end
