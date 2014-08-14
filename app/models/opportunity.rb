class Opportunity < ActiveRecord::Base
  belongs_to :user
  belongs_to :updated_by, class_name: "User"
  belongs_to :performance
  belongs_to :solicitation

  validates :user, presence: true
  validates :updated_by, presence: true
  validates :performance, presence: true
  validates :solicitation_id, presence: true
end
