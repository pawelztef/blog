class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :visitior
  has_many :notifications,as: :notifiable
end
