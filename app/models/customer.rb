class Customer < ActiveRecord::Base
  has_many :contacts, as: :organization
  has_many :performances, dependent: :destroy

  belongs_to :user

  validates :name, presence: true, uniqueness: true
  validates :user_id, presence: true
end
