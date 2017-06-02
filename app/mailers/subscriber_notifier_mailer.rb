class SubscriberNotifierMailer < ActionMailer::Base
# class SubscriberNotifierMailer < ApplicationMailer

  require 'sendgrid-ruby'
  include SendGrid
  require 'json'

  # def testmailer()
  #   @contact="kerryjae@live.com"
  #   @content="BLAH BLAH BLAH"
  #   @signature="Catch Me if You Can...Nae"
  #
  #   # set up a client to talk to the SENDGRID REST API
  #   mail(from: "kerryjae@gmail.com",
  #        subject: "Hey There",
  #        to: "kerryjae@gmail.com"
  #   )
  #
  #   sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
  #   response = sg.client.mail._('send').post(request_body: mail.to_json)
  #
  #   puts "Status- #{response.status_code}"
  #   puts "Body- #{response.body}"
  #   puts "Head- #{response.headers}"
  # end

# Original works but didn't use erb template
# Send new subscriber welcome email
  def subscribed(cnt, welcome, body)
    @contact=cnt
    @content=body
    @signature="Catch Me if You Can...Nae"

    # Generate a 6 digit random number to confirm 'Unsubscribes'
    @unsub_conf_key=100_000 + Random.rand(1_000_000 - 100_000)

    # set up a client to talk to the SENDGRID REST API
    from = Email.new(email: "RockawayIceLady@gmail.com")
    subject = welcome
    to = Email.new(email: "#{@contact.email}")
    content = Content.new(type: 'text/plain', value: "#{@content}")
    mail = Mail.new(from, subject, to, content)
    use_SendGrid(mail)
  end

  def event_ack(cnt, welcome, body)
    @contact=cnt
    @content=body
    @signature="Catch Me if You Can...Nae"

    # set up a client to talk to the SENDGRID REST API
    from = Email.new(email: "RockawayIceLady@gmail.com")
    subject = welcome
    to = Email.new(email: "#{@contact.email}")
    content = Content.new(type: 'text/plain', value: "#{@content}")
    mail = Mail.new(from, subject, to, content)
    use_SendGrid(mail)
  end

  def request_event(requester_email, subx, body)
    @content=body

    # set up a client to talk to the SENDGRID REST API
    from = Email.new(email: requester_email[0])
    subject = subx
    to = Email.new(email: "RockawayIceLady@gmail.com")
    content = Content.new(type: 'text/plain', value: "#{@content}")
    mail = Mail.new(from, subject, to, content)
    use_SendGrid(mail)
  end

  private
  def use_SendGrid(new_mail)
    mail=new_mail
    sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
    response = sg.client.mail._('send').post(request_body: mail.to_json)

    puts "Status- #{response.status_code}"
    puts "Body- #{response.body}"
    puts "Head- #{response.headers}"
  end

end
