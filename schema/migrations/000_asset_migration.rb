class AssetMigration < ActiveRecord::Migration
  def self.up
    create_table :assets do |t|
      t.string :name
      t.string :filename
      t.string :content_type
      t.integer :size
      t.integer :width
      t.integer :height
      t.integer :parent_id
      t.string :type # for use with ActiveRecord and polymorphic associations
      t.string :thumbnail
      t.string :user_id
      t.timestamps
    end
  end

  def self.down
    drop_table :assets
  end
end
