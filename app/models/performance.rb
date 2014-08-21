class Performance < ActiveRecord::Base
  CONTRACT_TYPE = ["Firm-Fixed Price", "Time and Materials"]

  has_many :performance_contacts
  has_many :contacts, through: :performance_contacts
  has_many :opportunities
  has_many :solicitations, through: :opportunities

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
  validates :updated_by, presence: true

  def contact_with_role(role_name)
    performance_contact = performance_contacts.find_by(role: role_name)
    if performance_contact
      performance_contact.contact
    else
      NullContact.new
    end
  end

  def null_cor_present?
    contact_with_role("Contracting Officer Representative").class == NullContact
  end

  def null_supervisor_present?
    contact_with_role("Supervisor").class == NullContact
  end

  def null_contract_lead_present?
    contact_with_role("Contract Lead").class == NullContact
  end

  def null_company_representative_present?
    contact_with_role("Company Representative").class == NullContact
  end

  def contracting_officer_representative
    contact_with_role("Contracting Officer Representative")
  end

  def supervisor
    contact_with_role("Supervisor")
  end

  def contract_lead
    contact_with_role("Contract Lead")
  end

  def company_representative
    contact_with_role("Company Representative")
  end

  def period_start
    starts_on.to_formatted_s(:long)
  end

  def period_end
    ends_on.to_formatted_s(:long)
  end

  def role_for(contact)
    performance_contacts.find_by(contact: contact).role
  end

  def customer_references
    contacts.customers
  end

  def partner_references
    contacts.partners
  end
end
