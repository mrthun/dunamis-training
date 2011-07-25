class CreateBasicData < ActiveRecord::Migration
  def self.up
    create_table :basic_data do |t|
      t.column :client_id, :integer
      t.column :client_type, :string
      t.column :name, :text
      t.column :comment, :string
      t.column :facility_type_id, :integer
      t.timestamps
    end
  end

  def self.down
    drop_table :basic_data
  end
end
