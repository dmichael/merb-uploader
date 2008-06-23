class QueuedJob < ActiveRecord::Base
  belongs_to :queueable, :polymorphic => true
end