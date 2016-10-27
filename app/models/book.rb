class Book < ActiveRecord::Base
  has_many :reviews


  def auth_name
    "#{self.author_fname} #{self.author_lname}".titleize
  end

  def published
    "#{self.publisher} #{self.publish_year}".titleize
  end
end
