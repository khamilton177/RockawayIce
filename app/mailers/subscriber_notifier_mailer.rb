class SubscriberNotifierMailer < ActionMailer::Base
# class SubscriberNotifierMailer < ApplicationMailer

  require 'sendgrid-ruby'
  include SendGrid
  require 'json'

# Original works but didn't use erb template
# Send new subscriber welcome email
  def subscribed(cnt, subx, body)
    @contact=cnt
    @content=body
    @signature="Catch Me if You Can...Nae\n RockawayIceLady@gmail.com\n 347-619-2421"
    @content+=@signature
    # set up a client to talk to the SENDGRID REST API
    from = Email.new(email: "RockawayIceLady@gmail.com")
    subject = subx
    to = Email.new(email: "#{@contact.email}")
    content = Content.new(type: 'text/plain', value: "#{@content}")
    mail = Mail.new(from, subject, to, content)
    use_SendGrid(mail)
  end

  #  Sends confirmation email to user after filling out Book an Event form.
  def ack_event(cnt, subx, body)
    puts "USER EMAIL IS #{cnt[0]}"
    @content=body
    @signature="Catch Me if You Can...Nae\nRockawayIceLady@gmail.com\n347-619-2421"
    @content+=@signature
    # set up a client to talk to the SENDGRID REST API
    from = Email.new(email: "RockawayIceLady@gmail.com")
    subject = subx
    to = Email.new(email: cnt[0])
    content = Content.new(type: 'text/plain', value: "#{@content}")
    mail = Mail.new(from, subject, to, content)
    use_SendGrid(mail)
  end

  #  Sends email to RockawayIceLady when user fills out Book an Event form.
  def request_event(cnt, subx, body)
    @content=body

    # set up a client to talk to the SENDGRID REST API
    from = Email.new(email: cnt[0])
    subject = subx
    to = Email.new(email: "RockawayIceLady@gmail.com")
    content = Content.new(type: 'text/plain', value: "#{@content}")
    mail = Mail.new(from, subject, to, content)
    use_SendGrid(mail)
  end

  #  Sends email to RockawayIceLady with results of Favorite Flavor Friday vote.
  def flavor_friday_results(flavor, votes)
    @content="Favorite Flavor Friday Voting is complete.\n
            Friday's flavor is #{flavor}.\n
            Votes cast- #{votes}."

    # set up a client to talk to the SENDGRID REST API
    from = Email.new(email: "RockawayIceLady@gmail.com")
    subject = "Favorite Flavor Friday- #{flavor}"
    to = Email.new(email: "RockawayIceLady@gmail.com")
    content = Content.new(type: 'text/plain', value: "#{@content}")
    mail = Mail.new(from, subject, to, content)
    use_SendGrid(mail)
  end

  private
  #  SendGrid API Call
  def use_SendGrid(new_mail)
    mail=new_mail
    sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
    response = sg.client.mail._('send').post(request_body: mail.to_json)

    puts "Status- #{response.status_code}"
    puts "Body- #{response.body}"
    puts "Head- #{response.headers}"
  end

end
