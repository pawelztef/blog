class ProjectImage < ActiveRecord::Base
  before_validation :default_title
  mount_uploader :image, ProjectImageUploader

  has_and_belongs_to_many :projects

  validates :title, presence: true

  def default_title
    self.title ||= File.basename(image.filename, '.*').titleize if image
  end

end
