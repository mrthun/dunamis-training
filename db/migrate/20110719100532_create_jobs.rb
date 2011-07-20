class CreateJobs < ActiveRecord::Migration
  def self.up
    create_table :jobs do |t|
      t.integer :creator_id
      t.string :creator_type
      t.integer :client_id
      t.string :client_type
      t.integer :registrant_id
      t.string :registrant_type
      t.text :facility
      t.datetime :date
      t.integer :hours
      t.text :location
      t.string :payroll_status
      t.string :invoice_status
      t.timestamps
    end
  end

  def self.down
    drop_table :jobs
  end
end
