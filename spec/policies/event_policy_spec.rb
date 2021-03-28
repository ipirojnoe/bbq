require 'rails_helper'

RSpec.describe EventPolicy, type: :policy do
  let(:first_user) { create(:user) }
  let(:second_user) { create(:user) }

  let(:first_context) { UserContext.new(first_user, {}) }
  let(:second_context) { UserContext.new(second_user, {}) }
  let(:guest_context) { UserContext.new(nil, {}) }

  let(:event) { create(:event, user: first_user) }
  let(:event_with_pin) { create(:event, user: first_user, pincode: '1235') }

  let(:cookie) { { "events_#{event_with_pin.id}_pincode" => '1235' } }
  let(:invalid_cookie) { { "events_#{event_with_pin.id}_pincode" => '1234' } }

  subject { described_class }

  context 'User' do
    context 'when user is the owner' do
      permissions :edit?, :destroy?, :update? do
        it { is_expected.to permit(first_context, event) }
      end
    end

    context 'when user is not the owner' do
      permissions :edit?, :update?, :destroy? do
        it { is_expected.not_to permit(second_context, event) }
      end
    end

    context 'when there is no pin' do
      permissions :show? do
        it { is_expected.to permit(second_context, event) }
        it { is_expected.to permit(first_context, event) }
      end
    end

    context 'when there is a pin' do
      permissions :show? do
        it { is_expected.not_to permit(second_context, event_with_pin) }
        it { is_expected.to permit(first_context, event_with_pin) }
        it { is_expected.to permit(UserContext.new(second_context, cookie), event_with_pin) }
        it { is_expected.not_to permit(UserContext.new(second_context, invalid_cookie), event_with_pin) }
      end
    end
  end

  context 'Guest' do
    context 'when no auth' do
      permissions :edit?, :update?, :destroy?, :create? do
        it { is_expected.not_to permit(guest_context, event) }
      end
    end

    context 'when auth' do
      context 'with pin' do
        permissions :show? do
          it { is_expected.not_to permit(guest_context, event_with_pin) }
          it { is_expected.not_to permit(UserContext.new(nil, invalid_cookie), event_with_pin) }
          it { is_expected.to permit(UserContext.new(nil, cookie), event_with_pin) }
        end
      end

      context 'without pin' do
        permissions :show? do
          it { is_expected.to permit(guest_context, event) }
          it { is_expected.to permit(UserContext.new(nil, cookie), event) }
        end
      end
    end
  end
end
