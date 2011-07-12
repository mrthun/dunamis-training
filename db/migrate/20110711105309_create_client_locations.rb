class CreateClientLocations < ActiveRecord::Migration
  def self.up
    create_table :client_locations do |t|
      t.column :client_id, :integer
      t.column :name, :string
      t.column :contact_name, :string
      t.column :address_1, :text
      t.column :address_2, :text
      t.column :city, :string
      t.column :zip, :integer
      t.column :phone, :text
      t.column :fax, :text
      t.column :email, :text
      t.timestamps
    end
  end

  def self.down
    drop_table :client_locations
  end
end
