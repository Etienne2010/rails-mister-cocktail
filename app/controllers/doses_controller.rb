class DosesController < ApplicationController

  def new
    @dose = Dose.new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail
  end

  def create
    parameters = doses_params
    description = parameters[:description]
    cocktail_id = parameters[:cocktail_id]
    ingredient_id = params[:ingredient_id]
    # p doses_params.valid?
    # p params.to_s.include?("permitted: false")
    if params[:dose][:description] != ""
      @dose = Dose.new(doses_params)
    else
      @dose = Dose.new(description: description, cocktail_id: cocktail_id.to_i, ingredient_id: ingredient_id.to_i)
      @dose = Dose.new
    end
    # @dose = Dose.new(doses_params)
    if @dose.save && params[:dose][:description] != ""
      p "saved"
      @cocktail = @dose.cocktail
      redirect_to cocktail_path(@cocktail)
    else
      id = params["h_cocktail"].to_i
      id = params[:dose][:cocktail_id] if id == 0
      if !id.nil?
        @cocktail = Cocktail.find(id)
      else
        render :new
        # redirect_to doses_new_path(Cocktail.all.first)
      end
    end
    # redirect_to show_path(@cocktail)
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
