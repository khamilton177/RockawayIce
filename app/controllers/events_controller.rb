class EventsController < ApplicationController
  require 'sendgrid-ruby'
  require 'json'
  include SendGrid

  def event_form
  end

  def request_event
    params.inspect
    puts "IM AT REQUEST EVENT"
    @requester_email=params[:email]
    requester_fname=params[:fname]
    requester_lname=params[:lname]
    requester_phone=params[:phone]
    evt_date=params[:date]
    evt_loc=params[:loc]
    evt_desc=params[:desc]
    evt_pkg_ice=params[:ices]
    evt_pkg_fire=params[:fire]

    if params[:ices] && params[:ices] == "1"
      evt_pkg_ice="Ice"
    end

    if params[:fire] && params[:fire] == "1"
      evt_pkg_fire="Fire"
    end

    @subject="New Event Request for #{evt_date}"
    @body="Contact- #{requester_fname.capitalize} #{requester_lname.capitalize}\n
                Phone- #{requester_phone}\n
                Packages of Interest- #{evt_pkg_ice} #{evt_pkg_fire}\n
                Event Date- #{evt_date}    Event Location- #{evt_loc}\n
                Description- #{evt_desc}"

    # call mailer method to send Event Request email to RockawayIceLady via SendGrid
    SubscriberNotifierMailer.request_event(@requester_email, @subject, @body).deliver_now
    redirect_to "/"
  end

  private

  def event_ack
  end

end
