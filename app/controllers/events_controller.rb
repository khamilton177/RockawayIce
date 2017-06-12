class EventsController < ApplicationController
  require 'sendgrid-ruby'
  require 'json'
  include SendGrid

  def event_form
  end

  def request_event
    params.inspect
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

    if !params[:ices] && !params[:fire]
      flash[:alert] = "Please select an event package"
      render :event_form
    else
      @subject_req="New Event Request for #{evt_date}"
      @body_req="Contact- #{requester_fname.capitalize} #{requester_lname.capitalize}\n
                  Phone- #{requester_phone}\n
                  Packages of Interest- #{evt_pkg_ice} #{evt_pkg_fire}\n
                  Event Date- #{evt_date}    Event Location- #{evt_loc}\n
                  Description- #{evt_desc}"

      @subject_ack="Your event request for #{evt_date} has been received."
      @body_ack="Hello #{requester_fname.capitalize}!\n
                  Thank you for your interest in booking an event with Rockaway Ice Lady.  We will be in contact soon.\n\n
                  If you have any concerns or questions before then, please feel free to contact us.\n"

      # call mailer method to send Event Request email to RockawayIceLady via SendGrid
      SubscriberNotifierMailer.request_event(@requester_email, @subject_req, @body_req).deliver_now
      # call mailer method to send Event Acknowledement email to user via SendGrid
      SubscriberNotifierMailer.ack_event(@requester_email, @subject_ack, @body_ack).deliver_now
      redirect_to "/"
    end
  end

end
