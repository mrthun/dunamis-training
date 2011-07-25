class CreatePays < ActiveRecord::Migration
  def self.up
    create_table :pays do |t|
      t.column :registrant_id, :integer
      t.column :registrant_type, :string
      t.column :hourly_rate, :integer
      t.column :regular_hours_from, :datetime
      t.column :regular_hours_to, :datetime
      t.column :overtime_hours_from, :datetime
      t.column :overtime_hours_to, :datetime
      t.column :night_hours_from, :datetime
      t.column :night_hours_to, :datetime
      t.column :weekend_hours_from, :datetime
      t.column :weekend_hours_to, :datetime
      t.column :pay_type_id, :integer
      t.timestamps
    end
  end

  def self.down
    drop_table :pays
  end
end
