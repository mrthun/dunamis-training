class CreatePreferences < ActiveRecord::Migration
  def self.up
    create_table :preferences do |t|
      t.column :registrant_id, :integer
      t.column :work_on_weekends, :boolean
      t.column :work_after_hours, :boolean
      t.column :max_driving_distance, :integer
      t.column :contract_type_id, :integer
      t.timestamps
    end
  end

  def self.down
    drop_table :preferences
  end
end
