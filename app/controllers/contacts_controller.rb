class ContactsController < ApplicationController
  require 'twilio-ruby'
  require 'sendgrid-ruby'
  require 'json'
  include SendGrid


  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    unless contact_params[:mobile].nil? || contact_params[:mobile] == ""
      format_mobile=ActionController::Base.helpers.number_to_phone(contact_params[:mobile], delimeter: "", country_code: 1)
    end
    if @contact.save
      unless @contact.mobile.nil? || @contact.mobile == ""
        @contact.mobile=format_mobile
        subscriberM=@contact.mobile
        @welcome="Welcome #{@contact.first_name}!  Now you'll receive info on latest promos, events, and flavors.  Please reply 'STOP' if you did not make this request."
        @media=""
        # add_cnt_notifyM(subscriberM, @welcome, @media)
      end
      unless @contact.email.nil? || @contact.email == ""
        @welcome="Thanks for subscribing to RockawayIceLady!"
        @body="Get ready to receive info on latest promos, events, and flavors.  If you woud like to 'Unsubscribe', please click the link below-"
        SubscriberNotifierMailer.subscribed(@contact, @welcome, @body).deliver_now
      end
      redirect_to "/"
    else
      render :new
    end
  end

  private

    def add_cnt_notifyM(subscriberM, welcome, media)
      # Get your Account Sid and Auth Token from twilio.com/user/account
      account_sid = ENV['TEST_TWIL_SID']
      auth_token = ENV['TEST_TWIL_TKN']
      bus_txt_num = '+15005550006'
      # http_basic_authenticate_with username: account_sid, password: auth_token, except: :index

      # set up a client to talk to the Twilio REST API
      @twilclient = Twilio::REST::Client.new account_sid, auth_token

      # create message
      message=@twilclient.account.messages.create({
        from: bus_txt_num,
        to: subscriberM,
        body: welcome,
        # media_url: media,
      })
      puts "MSG SID- #{message.sid}"
      puts "MSG To- #{message.to}"
      puts "MSG CODE- #{message.error_code}"
      puts "MSG Err- #{message.error_message}"
      puts "MSG Status- #{message.status}"
      @code=message.error_code
      puts "MSG Body- #{message.body}"
    end

    def contact_params
      params.require(:contact).permit(:first_name, :email, :mobile)
    end
end
