# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  username               :string
#  email                  :string           default(""), not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  avatar                 :string
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:github]

  has_many :events, dependent: :destroy
  has_many :comments
  has_many :subscriptions

  validates :username, presence: true, length: {maximum: 35}

  before_validation :set_name, on: :create

  after_commit :link_subscriptions, on: :create

  mount_uploader :avatar, AvatarUploader

  def self.find_for_github_oauth(access_token)
    email = access_token.info.email
    user = where(email: email).first

    return user if user.present?

    provider = access_token.provider
    url = access_token.extra.raw_info.html_url
    username = access_token.info.nickname
    avatar = access_token.info.image

    where(url: url, provider: provider).first_or_create! do |u|
      u.email = email
      u.password = Devise.friendly_token.first(16)
      u.username = username
      u.remote_avatar_url = avatar
    end
  end

  private

  def set_name
    self.username = "Товарисч №#{rand(777)}" if self.username.blank?
  end

  def link_subscriptions
    Subscription.where(user_id: nil, user_email: self.email)
                .update_all(user_id: self.id)
  end
end
