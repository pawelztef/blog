class PostImage < ActiveRecord::Base
  belongs_to :post

  has_attached_file :file,
    url: "/../assets/files/:id/:basename.:extension",
    path: ":rails_root/public/assets/files/:id/:basename.:extension"

  validates_attachment_size :file, :less_than => 10.megabytes
  validates_attachment_content_type :file, content_type: ['image/jpeg', 'image/png', 'image/gif']

end
