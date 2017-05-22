class ApplicationMailer < ActionMailer::Base
  require 'sendgrid-ruby'
  include SendGrid
  require 'json'

  default from: "kerryjae@gmail.com"
  layout 'mailer'
end
