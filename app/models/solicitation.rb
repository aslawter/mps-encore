class Solicitation < ActiveRecord::Base
  has_many :opportunities
  has_many :performances, through: :opportunities

  belongs_to :user
  belongs_to :customer
  belongs_to :partner
  belongs_to :updated_by, class_name: "User"

  validates :title, presence: true
  validates :description, presence: true
  validates :office, presence: true
  validates :solicitation_number, presence: true
  validates :deadline, presence: true
  validates :customer_id, presence: true
  validates :partner_id, presence: true
end
