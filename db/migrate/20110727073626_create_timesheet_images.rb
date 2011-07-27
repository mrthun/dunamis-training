class CreateTimesheetImages < ActiveRecord::Migration
  def self.up
    create_table :timesheet_images do |t|
      t.column :timesheet_id, :integer
      t.column :image_file_name,    :string
      t.column :image_content_type, :string
      t.column :image_file_size,    :integer
      t.column :image_updated_at,   :datetime
      t.timestamps
    end
  end

  def self.down
    drop_table :timesheet_images
  end
end
