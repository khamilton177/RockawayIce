namespace :promotions do

  desc "Weekly Task to reset svy_vote field in Flavors Table and email latest results for Favorite Flavor Fridays."
  task :reset_survey => :environment do
    @fri_flv=Flavor.order(svy_vote: :desc).first
    SubscriberNotifierMailer.flavor_friday_results("#{@fri_flv.name}", "#{@fri_flv.svy_vote}").deliver_now
    puts "Results mailed"
    Flavor.all.each do |flv|
      flv.update(svy_vote: 0)
      puts "Reset complete"
    end
  end
end
