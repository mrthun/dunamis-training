class CreateTimesheets < ActiveRecord::Migration
  def self.up
    create_table :timesheets do |t|
      t.integer :creator_id
      t.string :creator_type
      t.integer :client_id
      t.string :client_type
      t.integer :registrant_id
      t.string :registrant_type
      t.text :facility
      t.string :status
      t.datetime :end_of_week
      t.integer :total_hours
      t.timestamps
    end
  end

  def self.down
    drop_table :timesheets
  end
end
