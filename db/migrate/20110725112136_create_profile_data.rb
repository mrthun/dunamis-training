class CreateProfileData < ActiveRecord::Migration
  def self.up
    create_table :profile_data do |t|
      t.column :scheduler_id, :integer
      t.column :scheduler_type, :string
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
      t.timestamps
    end
  end

  def self.down
    drop_table :profile_data
  end
end
