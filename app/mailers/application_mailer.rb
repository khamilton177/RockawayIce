class ApplicationMailer < ActionMailer::Base
  require 'sendgrid-ruby'
  include SendGrid
  require 'json'

  default from: "RockawayIceLady@gmail.com"
  layout 'mailer'
end
