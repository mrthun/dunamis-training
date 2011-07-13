class CreateAddresses < ActiveRecord::Migration
  def self.up
    create_table :addresses do |t|
      t.column :client_id, :integer
      t.column :client_type, :string
      t.column :billing_contact_name, :string
      t.column :billing_address_1, :text
      t.column :billing_address_2, :text
      t.column :billing_city, :string
      t.column :billing_zip, :integer
      t.column :billing_phone, :text
      t.column :billing_fax, :text
      t.column :billing_email, :text
      
      t.column :location_contact_name, :string
      t.column :location_address_1, :text
      t.column :location_address_2, :text
      t.column :location_city, :string
      t.column :location_zip, :integer
      t.column :location_phone, :text
      t.column :location_fax, :text
      t.column :location_email, :text

      t.timestamps
    end
  end

  def self.down
    drop_table :addresses
  end
end
