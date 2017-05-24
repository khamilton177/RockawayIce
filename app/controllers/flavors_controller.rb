class FlavorsController < ApplicationController
  def about
    @flavor_waters=Flavor.where(category_id: "1")
    @flavor_cremes=Flavor.where(category_id: "2")
  end

  def flavor_friday_form
  end

  def flavor_faves
  end
end
