class PerformanceContact < ActiveRecord::Base
  CUSTOMER_ROLE = ["Contracting Officer Technical Representative", "Supervisor", "Other"]
  PARTNER_ROLE = ["Company Representative", "Other"]
  ALL_ROLES = CUSTOMER_ROLE + PARTNER_ROLE

  belongs_to :contact
  belongs_to :performance
  belongs_to :user
  belongs_to :updated_by, class_name: "User"

  validates :contact_id, presence: true
  validates :role, presence: true, 
    inclusion: {in: ALL_ROLES, message: "%{value} is not a valid contract type"}

  validates :performance, presence: true
  validates :user, presence: true
  validates :updated_by, presence: true
end
