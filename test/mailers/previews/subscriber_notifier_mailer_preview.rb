# Preview all emails at http://localhost:3000/rails/mailers/subscriber_notifier_mailer
class SubscriberNotifierMailerPreview < ActionMailer::Preview

  def subscribed
    SubscriberNotifierMailer.subscribed(cnt, welcome, body)
  end
end
