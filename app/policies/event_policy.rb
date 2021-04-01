class EventPolicy < ApplicationPolicy
  def update?
    user_owner?(record)
  end

  def edit?
    user_owner?(record)
  end

  def destroy?
    user_owner?(record)
  end

  def show?
    record.pincode.blank? ||
      user_owner?(record) ||
      record.pincode_valid?(cookies["events_#{record.id}_pincode"])
  end

  def create?
    user.present?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end

  private

  def user_owner?(event)
    user.present? && (event.user == user)
  end
end
