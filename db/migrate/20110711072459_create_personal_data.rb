class CreatePersonalData < ActiveRecord::Migration
  def self.up
    create_table :personal_data do |t|
      t.column :registrant_id, :integer
      t.column :registrant_type, :string
      t.column :first_name, :string
      t.column :middle_name, :string
      t.column :last_name, :string
      t.column :birth_date, :datetime
      t.column :home_address_1, :text
      t.column :home_address_2, :text
      t.column :city, :string
      t.column :zip, :integer
      t.column :home_phone, :text
      t.column :cell_phone, :text
      t.column :hire_date, :datetime
      t.column :social_security_number, :integer
      t.column :bank, :string
      t.column :account_number, :text
      t.column :routing_number, :text

      t.timestamps
    end
  end

  def self.down
    drop_table :personal_data
  end
end
