class Opportunities < ActiveRecord::Base
  belongs_to :user
  belongs_to :updated_by
  belongs_to :performance
  belongs_to :solicitation

  validates :user, presence: true
  validates :updated_by, presence: true
  validates :performance, presence: true
  validates :solicitation, presence: true
end
