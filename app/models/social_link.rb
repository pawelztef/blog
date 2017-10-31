class SocialLink < ActiveRecord::Base
  belongs_to :social_module
  mount_uploader :icon, IconUploader
  validates :icon, presence: true
  validates :url, presence: true
end
