class Subscription < ApplicationRecord
  EMAIL_REGEX = /\A[a-z\d_+.\-]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  belongs_to :event
  belongs_to :user, optional: true

  validates :user_name, presence: true, unless: -> { user.present? }
  validates :user_email, presence: true, format: EMAIL_REGEX, unless: -> { user.present? }

  validates :user, uniqueness: {scope: :event_id}, if: -> { user.present? }
  validates :user_email, uniqueness: {scope: :event_id}, unless: -> { user.present? }

  validate :check_email_for_existence, unless: -> { user.present? }
  validate :check_whos_subscription, if: -> { user.present? }
  
  def user_name
    if user.present?
      user.username
    else
      super
    end
  end

  def user_email
    if user.present?
      user.email
    else
      super
    end
  end

  private

  def check_email_for_existence
    errors.add(:user_email, :email_exist) if User.find_by(email: user_email).present?
  end

  def check_whos_subscription
    errors.add(:user, :exist) if event.user == user
  end
end
