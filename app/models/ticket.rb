class Ticket < ApplicationRecord
  belongs_to :assigned_user, class_name: :User, optional: true
end
