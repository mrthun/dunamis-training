class CreateBillingData < ActiveRecord::Migration
  def self.up
    create_table :billing_data do |t|
      t.column :client_id, :integer
      t.column :client_type, :string
      t.column :preferred_bill_in, :string
      t.column :pay_term, :string
      t.column :week_start, :string
      t.column :week_end, :string
      t.column :over_time, :string
      t.column :lunch_rule, :integer
      t.column :lunch_break, :integer
      t.column :time_rounding, :integer
      t.column :pay_type_id, :integer
      t.column :credit_line, :integer
      t.column :interest, :integer
      t.column :charge_interest, :boolean
      
      t.timestamps
    end
  end

  def self.down
    drop_table :billing_data
  end
end
