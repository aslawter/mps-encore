class Performance < ActiveRecord::Base
  CONTRACT_TYPE = ["Firm-Fixed Price", "Time and Materials"]

  has_many :performance_contacts
  has_many :contacts, through: :performance_contacts

  belongs_to :customer
  belongs_to :partner
  belongs_to :user

  validates :title, presence: true, uniqueness: true
  validates :contract_number, presence: true, uniqueness: true
  validates :starts_on, presence: true
  validates :ends_on, presence: true
  validates :contract_type, presence: true
  validates :value, presence: true
  validates :partner_id, presence: true
  validates :user, presence: true
end