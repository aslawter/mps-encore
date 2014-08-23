class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true

  has_many :performances
  has_many :performance_contacts
  has_many :contacts, dependent: :destroy
  has_many :customers, dependent: :destroy
  has_many :partners, dependent: :destroy
  has_many :solicitations, dependent: :destroy
  has_many :opportunities, dependent: :destroy
  has_many :attachments

  def self.newest_first
    order(created_at: :desc)
  end

  def self.inactive
    where(active: false)
  end
end
