require 'rails_helper'

describe NotificationService do
  let!(:user) do
    User.create(
      name: "Test User",
      email: "testuser@example.com",
      send_due_date_reminder: 1,
      due_date_reminder_interval: 1,
      due_date_reminder_time: "12:30:00"
    )
  end
  let!(:ticket) { Ticket.create(assigned_user: user, due_date: "2023-04-01") }

  describe '.task_reminder' do
    it 'sends a reminder via the preferred notification method of the user' do
      expect(NotificationService).to receive(:email_task_reminder).with(ticket, user)

      NotificationService.task_reminder(ticket)
    end

    it 'does not send reminders when the user has no notification preferences set' do
      user.update(send_due_date_reminder: 0)

      expect(NotificationService).not_to receive(:email_task_reminder).with(ticket, user)

      NotificationService.task_reminder(ticket)
    end
  end

  describe '.email_task_reminder' do
    it 'delegates sending an email reminder to the ApplicationMailer class' do
      expect(ApplicationMailer).to receive_message_chain(:due_date_reminder, :deliver_later)

      NotificationService.email_task_reminder(ticket, user)
    end
  end
end
