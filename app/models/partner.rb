class Partner < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :website, presence: true, uniqueness: true
end
