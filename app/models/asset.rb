require 'mime/types'
class Asset < DataMapper::Base
  property :name, :string
  property :filename, :string
  property :content_type, :string
  property :size, :integer
  property :width, :integer
  property :height, :integer
  property :parent_id, :integer
  property :user_id, :integer
  property :type, :string
  property :thumbnail, :string
  property :created_at, :datetime
  property :updated_at, :datetime  
  
  has_attachment  :storage => FILE_STORAGE, :s3_access => "private",
                  :path_prefix => PATH_PREFIX,
                  :max_size => 10.megabytes,
                  :thumbnails => { :thumb => '80x80>', :tiny => '40x40>' },
                  :processor => :MiniMagick # attachment_fu looks in this order: ImageScience, Rmagick, MiniMagick

  validates_as_attachment

  def swf_uploaded_data=(file_data)
    my_file = file_data["tempfile"] if !file_data.nil? and !file_data["tempfile"].nil?
    return nil if my_file.nil? || my_file.size == 0

    file_data["content_type"] = MIME::Types.type_for(file_data["filename"]).to_s
    self.content_type = file_data["content_type"] #if file_data.respond_to?(:content_type)
    self.filename = file_data["filename"]# if respond_to?(:filename)

    if my_file.is_a?(StringIO)
      my_file.rewind
      self.temp_data = my_file.read
    else
      self.temp_path = my_file.path
    end
    # self.file = data
    #        return nil if file_data.nil? || file_data.size == 0 
    #        # Map file extensions to mime types.  Thanks to bug in Flash 8
    #        # the content type is always set to application/octet-stream.
    #        self.filename = file_data.filename if respond_to?(:filename)
    #        mime = MIME::Types.type_for(self.filename)[0]
    #        self.content_type = mime.blank? ? file_data.content_type : mime.content_type
    #        if file_data.is_a?(StringIO)
    #          file_data.rewind
    #          self.temp_data = file_data.read
    #        else
    #          self.temp_path = file_data.path
    #        end
  end
end