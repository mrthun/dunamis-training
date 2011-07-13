class CreateWorkLocations < ActiveRecord::Migration
  def self.up
    create_table :work_locations do |t|
      t.column :registrant_id, :integer
      t.column :registrant_type, :string
      t.column :name, :string
      t.column :first_worked, :string
      t.column :received_orientation, :datetime
      t.column :do_not_schedual, :boolean
      t.column :comment, :text
      t.timestamps
    end
  end

  def self.down
    drop_table :locations
  end
end
