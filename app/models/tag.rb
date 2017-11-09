class Tag < ActiveRecord::Base
  has_many :posts, through: :post_tags
  has_and_belongs_to_many :projects
  validates :name, presence: true
  def in_use? 
    PostTag.exists?(tag_id: self.id)
  end
end
