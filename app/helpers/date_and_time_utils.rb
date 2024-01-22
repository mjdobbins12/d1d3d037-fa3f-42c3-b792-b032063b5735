module DateAndTimeUtils
  class << self
    def ticket_reminder_datetime(ticket, reminder_interval, reminder_time)
      ticket.due_date - reminder_interval.days + reminder_time.hour.hours + reminder_time.min.minutes
    end
  end
end
