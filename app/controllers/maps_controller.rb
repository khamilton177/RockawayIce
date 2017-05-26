class MapsController < ApplicationController
  def wheres_cart
    @locations=Location.all
  end

  # def request_cart
  # end
end
