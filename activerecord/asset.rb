class Asset < ActiveRecord::Base  
  has_attachment  :storage => FILE_STORAGE,
                  :max_size => 10.megabytes,
                  :thumbnails => { :thumb => '80x80>', :tiny => '40x40>' },
                  :content_type => ["application/octet-stream", "audio/mpeg", "audio/x-aiff", "audio/aiff", "audio/aiff", "audio/x-wav", "audio/wav"],
                  :processor => :MiniMagick # attachment_fu looks in this order: ImageScience, Rmagick, MiniMagick

  validates_as_attachment
  
  def swf_uploaded_data=(file_data)
    return nil if file_data.nil? || file_data.size == 0 
    # Map file extensions to mime types.  Thanks to bug in Flash 8
    # the content type is always set to application/octet-stream.
    self.filename = file_data.original_filename if respond_to?(:filename)
    mime = MIME::Types.type_for(self.filename)[0]
    self.content_type = mime.blank? ? file_data.content_type : mime.content_type
    if file_data.is_a?(StringIO)
      file_data.rewind
      self.temp_data = file_data.read
    else
      self.temp_path = file_data.path
    end
  end
end