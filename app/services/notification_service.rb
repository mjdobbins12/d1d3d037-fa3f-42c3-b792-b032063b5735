module NotificationService
  class << self
    def task_reminder(ticket)
      user = ticket.assigned_user

      user.notification_preferences.each do |notification_method|
        begin
          self.send("#{notification_method}_task_reminder", ticket, user)
        rescue NoMethodError
          Rails.logger.error("Attempted to send undefined notification method #{notification_method} for user #{user.id}")
        end
      end
    end

    def email_task_reminder(ticket, user)
      delivery_date_and_time = DateAndTimeUtils.ticket_reminder_datetime(
        ticket,
        user.due_date_reminder_interval,
        user.due_date_reminder_time
      )

      ApplicationMailer.due_date_reminder(ticket.id, user.id).deliver_later(wait_until: delivery_date_and_time)
    end
  end
end
