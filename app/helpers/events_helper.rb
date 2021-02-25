module EventsHelper
  def is_subscribed?(event)
    user_signed_in? && event.subscriptions.where(user: current_user).present?
  end
end
