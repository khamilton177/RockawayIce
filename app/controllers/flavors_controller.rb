class FlavorsController < ApplicationController
  def about
    @flavor_waters=Flavor.where(category_id: "1")
    @flavor_cremes=Flavor.where(category_id: "2")
  end

  def flavor_friday_form
    @flavor_waters=Flavor.where(category_id: "1")
    @flavor_cremes=Flavor.where(category_id: "2")
    # respond_to do |format|
    #   format.js { render :js => "cutOffVote();" }
    # end
  end

  def vote
    params.inspect

    if params[:water] && params[:water] != ""
      water=params[:water]
    else
      creme=params[:creme]
    end
    redirect_to "/"
  end

  def flavor_faves
  end
end
