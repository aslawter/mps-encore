class Contact < ActiveRecord::Base
  belongs_to :organization, polymorphic: true

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :title, presence: true
  validates :email, presence: true, uniqueness: true
  validates :phone, presence: true
  validates :fax, presence: true

  def self.customer
    where(organization_type: "Customer")
  end

  def self.partner
    where(organization_type: "Partner")
  end
end
