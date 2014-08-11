class PerformanceContact < ActiveRecord::Base
  CUSTOMER_ROLE = ["Supervisor", "Contracting Officer Technical Representative", "Other"]
  PARTNER_ROLE = ["Company Representative", "Other"]

  belongs_to :contact
  belongs_to :performance
  belongs_to :user

  validates :contact_id, presence: true
  validates :role, presence: true
  validates :performance, presence: true
  validates :user, presence: true
end
