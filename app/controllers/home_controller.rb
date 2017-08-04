class HomeController < ApplicationController

  def index
  end

  def download_card
      send_file "#{Rails.root}/public/rockawayice_loyalty_card.pdf", type: 'application/pdf', disposition: 'attachment'
  end

  def commercial
  end

end
