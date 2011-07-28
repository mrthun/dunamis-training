class CreateTimesheetEntries < ActiveRecord::Migration
  def self.up
    create_table :timesheet_entries do |t|
      t.column :timesheet_id, :integer
      t.column :day, :string
      t.column :break_start, :text
      t.column :break_end, :text
      t.column :time_in, :text
      t.column :time_out, :text
      t.column :hours, :text
      t.timestamps
    end
  end

  def self.down
    drop_table :timesheet_entries
  end
end
