class ApplicationMailer < ActionMailer::Base
  default from: "notifications@plan_radar.example.com"
  layout "mailer"

  def due_date_reminder(ticket_id, user_id)
    @ticket = Ticket.find(ticket_id)
    @user = User.find(user_id)

    if @user != @ticket.assigned_user
      Rails.logger.warn("Not sending due date reminder email as user #{@user.id} is not assigned to ticket #{@ticket.id}")
      return
    end

    mail(to: @user.email, subject: "Due date reminder for your assigned task")
  end
end
