require 'rails_helper'

describe User, type: :model do
  let(:user) { User.new(name: "Test User", email: "testuser@example.com") }

  describe '#notification_preferences' do
    context 'when the user has no notification preferences set' do
      it 'returns an empty array' do
        expect(user.notification_preferences).to eq([])
      end
    end

    context 'when the user has opted into email reminders' do
      it 'returns an array listing the user prefences' do
        user.update(send_due_date_reminder: 1)

        expect(user.notification_preferences).to eq(["email"])
      end
    end
  end

  describe '#add_notification_method' do
    it 'stores the preferred notification method for the user' do
      expect(user.send_due_date_reminder).to be_nil
      
      user.add_notification_method("email")

      expect(user.send_due_date_reminder).to eq(1)
    end

    it 'does not store an unknown notification method' do
      user.add_notification_method("homing pigeon")

      expect(user.send_due_date_reminder).to be_nil
    end
  end
end
