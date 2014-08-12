class Contact < ActiveRecord::Base
  belongs_to :organization, polymorphic: true
  belongs_to :user

  has_many :performance_contacts, dependent: :destroy
  has_many :performances, through: :performance_contacts

  validates :user, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :title, presence: true
  validates :email, presence: true, uniqueness: true
  validates :phone, presence: true, length: {is: 10}
  validates :fax, presence: true, length: {is: 10}


  def self.customers
    where(organization_type: "Customer")
  end

  def self.partners
    where(organization_type: "Partner")
  end

  def full_name
    first_name + ' ' + last_name
  end
end
