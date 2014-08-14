class Partner < ActiveRecord::Base
  has_many :contacts, as: :organization
  has_many :performances
  has_many :solicitations

  belongs_to :user

  validates :name, presence: true, uniqueness: true
  validates :website, presence: true, uniqueness: true
  validates :user, presence: true
end
