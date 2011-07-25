class CreateFacilityTypes < ActiveRecord::Migration
  def self.up
    create_table :facility_types do |t|
      t.column :title, :string
      t.timestamps
    end
  end

  def self.down
    drop_table :facility_types
  end
end
