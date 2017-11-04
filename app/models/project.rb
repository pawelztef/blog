class Project < ActiveRecord::Base
  has_and_belongs_to_many :project_images
  validates :title, presence: true 
  validates :description, presence: true
  accepts_nested_attributes_for :project_images

end
