class Project < ActiveRecord::Base
  has_and_belongs_to_many :project_images
  has_and_belongs_to_many :tags
  validates :title, presence: true 
  validates :description, presence: true
  accepts_nested_attributes_for :project_images
  accepts_nested_attributes_for :tags

end
