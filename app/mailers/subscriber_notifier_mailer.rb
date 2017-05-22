# class SubscriberNotifierMailer < ActionMailer::Base
class SubscriberNotifierMailer < ApplicationMailer

  require 'sendgrid-ruby'
  include SendGrid
  require 'json'

  # subscriber_notifier_mailer 'subscribed'

  def subscribed(cnt, welcome, body)
    @contact=cnt
    @content=body
    @signature="Catch Me if You Can...Nae"

    # set up a client to talk to the SENDGRID REST API
    from = Email.new(email: "kerryjae@gmail.com")
    subject = welcome
    to = Email.new(email: "#{@contact.email}")
    content = Content.new(type: 'text/plain', value: "#{@content}")
    mail = Mail.new(from, subject, to, content)

    sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
    response = sg.client.mail._('send').post(request_body: mail.to_json)

    puts "Status- #{response.status_code}"
    puts "Body- #{response.body}"
    puts "Head- #{response.headers}"
  end

end
