class MailDeliveryJob < ApplicationJob
  queue_as :default

  def perform(arg)
    event = arg.event

    case arg
    when Comment
      all_emails = (event.subscriptions.map(&:user_email) + [event.user.email]).uniq - [event.comments.last.user&.email]

      all_emails.each do |mail|
        EventMailer.comment(event, arg, mail).deliver_later
      end
    when Photo
      all_emails = (event.subscriptions.map(&:user_email) + [event.user.email]).uniq - [event.photos.last.user&.email]

      all_emails.each do |mail|
        EventMailer.comment(event, arg, mail).deliver_later
      end
    when Subscription
      EventMailer.subscription(event, arg).deliver_later
    end
  end
end
