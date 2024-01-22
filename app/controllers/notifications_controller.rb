class NotificationsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def reminder
    ticket = Ticket.find(params[:id])

    if ticket.present?
      NotificationService.task_reminder(ticket)

      return head :ok
    else
      return head :not_found
    end
  end
end
