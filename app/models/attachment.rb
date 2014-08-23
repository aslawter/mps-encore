class Attachment < ActiveRecord::Base
  mount_uploader :file, AttachmentUploader

  belongs_to :user
  belongs_to :updated_by, class_name: "User"
  belongs_to :solicitation

  validates :file, presence: true
  validates :solicitation, presence: true
  validates :user, presence: true
  validates :updated_by, presence: true
end
