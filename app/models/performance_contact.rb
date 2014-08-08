class PerformanceContact < ActiveRecord::Base
  CUSTOMER_ROLE = ["Supervisor", "Contracting Officer Technical Representative", "Other"]
  PARTNER_ROLE = ["Company Representative", "Other"]

  belongs_to :contact
  belongs_to :performance
  belongs_to :user

  def period_start
    starts_on.to_formatted_s(:long)
  end

  def period_end
    ends_on.to_formatted_s(:long)
  end
end
