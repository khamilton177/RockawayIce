class FlavorsController < ApplicationController
  def about
    @flavor_waters=Flavor.where(category_id: "1")
    @flavor_cremes=Flavor.where(category_id: "2")
  end

  def flavor_friday_form
    @categories=Category.where.not(id: "3")
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
      @flavor=Flavor.find(water)
    else
      creme=params[:cremes]
      @flavor=Flavor.find(creme)
    end

    vote=@flavor.svy_vote
    # incase the svy_vote field is NIL set to 1 to keep increment method from erroring
    if vote.nil?
      vote=0
    end

    puts "Vote before- #{vote}"
    vote+=1
    puts "New vote count- #{vote}"
    @flavor.update(svy_vote: vote)
    redirect_to flavors_flavor_faves_path
  end

  def flavor_faves
    @flavors=Flavor.all
    @flavors=@flavors.order(svy_vote: :desc).limit(5)
    @first=@flavors.first
  end
end
