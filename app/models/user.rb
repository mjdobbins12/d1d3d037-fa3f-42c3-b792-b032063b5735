class User < ApplicationRecord
  NOTIFICATION_METHODS = {
    1 => "email"
  }.freeze

  def notification_preferences
    if send_due_date_reminder.blank?
      return []
    end

    NOTIFICATION_METHODS.select { |key, _| send_due_date_reminder & key == key }.values
  end

  def add_notification_method(notification_method)
    key = NOTIFICATION_METHODS.key(notification_method)

    if key.present?
      update(send_due_date_reminder: send_due_date_reminder | notification_method)
    end
  end
end
