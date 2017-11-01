class SocialModule < ActiveRecord::Base
  has_many :social_links, inverse_of: :social_module
  accepts_nested_attributes_for :social_links, reject_if: :all_blank, allow_destroy: true
  
  def self.instance
    SocialModule.first_or_create(id: 1)
  end

end
