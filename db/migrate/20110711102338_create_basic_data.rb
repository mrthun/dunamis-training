class CreateBasicData < ActiveRecord::Migration
  def self.up
    create_table :basic_data do |t|
      t.column :client_id, :integer
      t.column :name, :text
      t.column :comment, :string
      t.column :client_type_id, :integer
      t.timestamps
    end
  end

  def self.down
    drop_table :basic_data
  end
end
