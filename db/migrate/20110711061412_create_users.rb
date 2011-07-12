class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table "users" do |t|
      t.column :name,                     :string, :limit => 100
      t.column :email,                     :string, :limit => 100
      t.column :crypted_password,          :string, :limit => 40
      t.column :salt,                      :string, :limit => 40
      t.column :created_at,                :datetime
      t.column :updated_at,                :datetime
      t.column :remember_token,            :string, :limit => 40
      t.column :remember_token_expires_at, :datetime

      t.column :activation_code,           :string, :limit => 40
      t.column :activated_at,              :datetime
      t.column :status_id,                 :integer
      t.column :organization_id,           :integer

    end

    add_index :users, :email, :unique => true

    create_table "roles", :force => true do |t|
      t.column :title, :string
    end
    create_table "roles_users", :id => false, :force => true do |t|
      t.column :role_id, :integer
      t.column :user_id, :integer
    end

  end

  def self.down
    drop_table "users"
  end
end
