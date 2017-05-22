class ApplicationMailer < ActionMailer::Base
  require 'sendgrid-ruby'
  require 'json'
  include SendGrid

  default from: "kerryjae@gmail.com"
  layout 'mailer'
end
