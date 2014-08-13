class Performance < ActiveRecord::Base
  CONTRACT_TYPE = ["Firm-Fixed Price", "Time and Materials"]

  has_many :performance_contacts
  has_many :contacts, through: :performance_contacts

  belongs_to :customer
  belongs_to :partner
  belongs_to :user
  belongs_to :updated_by, class_name: "User"

  validates :title, presence: true
  validates :contract_number, presence: true, uniqueness: true
  validates :starts_on, presence: true
  validates :ends_on, presence: true
  validates :contract_type, presence: true,
    inclusion: {in: CONTRACT_TYPE, message: "%{value} is not a valid contract type"}
  validates :value, presence: true
  validates :partner_id, presence: true
  validates :user, presence: true

  def role_for(contact)
    performance_contacts.find_by(contact: contact).role
  end

  def customer_references
    contacts.customers
  end

  def partner_references
    contacts.partners
  end

  def period_start
    starts_on.to_formatted_s(:long)
  end

  def period_end
    ends_on.to_formatted_s(:long)
  end
end
