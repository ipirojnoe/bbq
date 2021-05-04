# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  address     :string
#  datetime    :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer          not null
#  pincode     :string
#
class Event < ApplicationRecord
  belongs_to :user

  has_many :comments, dependent: :destroy
  has_many :subscriptions, dependent: :destroy
  has_many :subscribers, through: :subscriptions, source: :user, dependent: :destroy
  has_many :photos, dependent: :destroy

  validates :title, presence: true, length: { maximum: 255 }
  validates :address, :datetime, presence: true

  def visitors
    (subscribers + [user]).uniq
  end

  def pincode_valid?(pin2check)
    pincode == pin2check
  end
end
