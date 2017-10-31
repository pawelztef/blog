class SocialLink < ActiveRecord::Base
  belongs_to :social_module
  validates :icon, presence: true
  validates :url, presence: true
end
