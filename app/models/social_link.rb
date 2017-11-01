class SocialLink < ActiveRecord::Base
  belongs_to :social_module
  mount_uploader :icon, IconUploader

  URL_REGEX = /^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/ix
  validates :icon, presence: true
  validates :url, presence: true, format: { with: URL_REGEX, multiline: true, message: 'Incorrect format' }

end
