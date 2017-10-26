class Moderator < ActiveRecord::Base
  has_secure_password
  has_many :posts
  has_one :bio
  mount_uploader :avatar, AvatarUploader

  validates :fullname, presence: true
  validates :username, presence: true, format: { with: /@/, message: 'is not valid'}
  validates :password, presence: true, confirmation: true

end
