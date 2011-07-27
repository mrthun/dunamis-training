class CreateTimesheetEntries < ActiveRecord::Migration
  def self.up
    create_table :timesheet_entries do |t|
      t.column :timesheet_id, :integer
      t.column :day, :string
      t.column :break_start, :datetime
      t.column :break_end, :datetime
      t.column :time_in, :datetime
      t.column :time_out, :datetime
      t.column :hours, :integer
      t.timestamps
    end
  end

  def self.down
    drop_table :timesheet_entries
  end
end
