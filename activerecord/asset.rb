class Asset < ActiveRecord::Base
  has_one :queued_job, :as => :queueable

  
  has_attachment  :storage => :file_system,#:s3 
                  :max_size => 10.megabytes,
                  :thumbnails => { :thumb => '80x80>', :tiny => '40x40>' },
                  :processor => :MiniMagick # attachment_fu looks in this order: ImageScience, Rmagick, MiniMagick

  validates_as_attachment
  
  after_save :create_queued_job
  
  def create_queued_job
    unless self.parent_id
      # Once a site is saved, create a Job
      queued_job = QueuedJob.new(:queueable_type => self.class.name, :queueable_id => self.id)
      queued_job.save
    end
  end
end