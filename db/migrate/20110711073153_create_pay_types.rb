class CreatePayTypes < ActiveRecord::Migration
  def self.up
    create_table :pay_types do |t|
      t.column :title, :string
      t.timestamps
    end
  end

  def self.down
    drop_table :pay_types
  end
end
