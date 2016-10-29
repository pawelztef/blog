class Book < ActiveRecord::Base
  has_one :review, dependent: :destroy
  accepts_nested_attributes_for :review


  has_attached_file :cover,
    styles: { small: "100x150", medium: "200x300"},
    url: "/assets/covers/:id/:style/:basename.:extension",
    path: ":rails_root/public/assets/covers/:id/:style/:basename.:extension"
    # default_url: "/images/:style/missing.png"
    validates_attachment_size :cover, :less_than => 10.megabytes
    validates_attachment_content_type :cover, content_type: ['image/jpeg', 'image/png', 'image/gif']


  def auth_name
    "#{self.author_fname} #{self.author_lname}".titleize
  end

  def published
    "#{self.publisher} #{self.publish_year}".titleize
  end

  def show 
    Book.where.not(id: self.id).find_each do |b|
      b.update_attributes(display: false)
    end
    return true unless !self.update_attributes(display: true) 
  end
end
