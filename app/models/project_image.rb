class ProjectImage < ActiveRecord::Base
  has_and_belongs_to_many :projects
  mount_uploader :image, ProjectImageUploader
  validates :title, presence: true

end
