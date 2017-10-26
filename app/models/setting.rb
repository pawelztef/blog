class Setting < ActiveRecord::Base
  def self.site_name
    Setting.first.try(:site_name)
  end
  def self.post_per_page
    Setting.first.try(:post_per_page)
  end
  def self.site_phrase
    Setting.first.try(:site_phrase)
  end
  def self.tag_visible?
    Setting.first.try(:tag_visibility)
  end
  def self.prevent_commenting?
    if Setting.first.try(:prevent_commenting)
      return true
    else
      return false
    end
  end
  def self.display_reviews?
    Setting.first.try(:display_reviews)
  end
end
