class MapsController < ApplicationController
  def wheres_cart
    @locations=Location.all
    # respond_to do |format|
    #   format.html
    #   format.json
    #   format.js
    # end
  end

  # def request_cart
  # end
end
