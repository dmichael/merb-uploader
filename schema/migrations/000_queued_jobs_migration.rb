class CreateQueuedJobs < ActiveRecord::Migration
	def self.up
	  create_table :queued_jobs do |t|
	    t.integer :queueable_id
	    t.string :queueable_type
	    t.boolean :in_progress, :default => false
	    t.boolean :completed, :default => false
	    t.timestamps
	  end
	end

	def self.down
	  drop_table :queued_jobs
	end
end