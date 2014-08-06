class Customer < ActiveRecord::Base
  has_many :contacts, as: :organization

  validates :name, presence: true, uniqueness: true
end
