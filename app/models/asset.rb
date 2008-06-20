class Asset < DataMapper::Base
  property :name, :string
  property :filename, :string
  property :content_type, :string
  property :size, :integer
  property :width, :integer
  property :height, :integer
  property :parent_id, :integer
  property :attachable_type, :string # for use with ActiveRecord and polymorphic associations
  property :attachable_id, :integer # for use with ActiveRecord and polymorphic associations
  property :thumbnail, :string
  property :created_at, :datetime
  
  has_attachment  :storage => :file_system,#:s3 
                  :max_size => 10.megabytes,
                  :thumbnails => { :thumb => '80x80>', :tiny => '40x40>' },
                  :processor => :MiniMagick # attachment_fu looks in this order: ImageScience, Rmagick, MiniMagick

  validates_as_attachment

end