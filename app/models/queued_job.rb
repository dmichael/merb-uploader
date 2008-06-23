class QueuedJob < DataMapper::Base
  property :in_progress, :boolean
  property :completed, :boolean
  property :queueable_type, :string # for use with ActiveRecord and polymorphic associations
  property :queueable_id, :integer  # for use with ActiveRecord and polymorphic associations
  property :created_at, :datetime
  property :updated_at, :datetime  
end