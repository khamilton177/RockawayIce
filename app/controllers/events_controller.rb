class EventsController < ApplicationController
  require 'sendgrid-ruby'
  require 'json'
  include SendGrid

  def event_form
  end

  def request_event
    params.inspect
    requester_email=params[:email]
    requester_fname=params[:fname]
    requester_lname=params[:lname]
    requester_phone=params[:phone]
    evt_date=params[:date]

    evt_loc=params[:loc]
    evt_desc=params[:desc]
    evt_pkg_ice=""
    evt_pkg_fire=""

    if params[:ices] && params[:ices] == "1"
      evt_pkg_ice="Ice"
    end

    if params[:fire] && params[:fire] == "1"
      evt_pkg_fire="Fire"
    end

    puts @subject="New Event Request for #{evt_date}"
    puts @body="Contact- #{requester_fname.capitalize} #{requester_lname.capitalize}\n
                Phone- #{requester_phone}\n
                Packages of Interest- #{evt_pkg_ice} #{evt_pkg_fire}\n
                Event Date- #{evt_date}    Event Location- #{evt_loc}\n
                Description- #{evt_desc}"

    # call mailer method to send Event Request email to RockawayIceLady via SendGrid
    # SubscriberNotifierMailer.event_request(@subject, @body).deliver_now
    redirect_to "/"
  end

end
