class FlavorsController < ApplicationController

before_action :generate_color


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
    flv_select=params[:flavor][:id]
    @flavor=Flavor.find(flv_select)

    vote=@flavor.svy_vote
    # incase the svy_vote field is NIL set to 1 to keep increment method from erroring
    if vote.nil?
      vote=0
    end

    # puts "Vote before- #{vote}"
    vote+=1
    # puts "New vote count- #{vote}"
    @flavor.update(svy_vote: vote)
   redirect_to flavors_flavor_faves_path
 end

  def flavor_faves
    @flavors=Flavor.all
    @flavors=@flavors.order(svy_vote: :desc).limit(5)
    @first=@flavors.first
  end

  private

  # create colors for Flavor List on About page
  def generate_color
    colors= [
        "#FF3AAE",
        "#B9D61A",
        "#952DE1",
        "#A4D789",
        "#51A3A3",
        "#D96C06",
        "#039be5"
      ];

    @p_colors=[]
    cnt=Flavor.all.length
    colors.cycle(cnt) do |color|
      @p_colors.push(color)
      @cnt=1
    end
  end

end
