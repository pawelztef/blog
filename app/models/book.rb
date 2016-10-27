class Book < ActiveRecord::Base
  has_one :review, dependent: :destroy
  accepts_nested_attributes_for :review


  def auth_name
    "#{self.author_fname} #{self.author_lname}".titleize
  end

  def published
    "#{self.publisher} #{self.publish_year}".titleize
  end
end
