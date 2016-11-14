class Message < ActiveRecord::Base
  belongs_to :visitor

  validates :content, presence: true
  
  scope :unread, lambda {where(status: false)}

  def self.matching_fullname_or_content params
    joins(:visitor).where("fullname LIKE ? OR content LIKE ?", "%#{params}%", "%#{params}%")
  end

  def mark_read
    update(status: true) if status == false
  end

end
