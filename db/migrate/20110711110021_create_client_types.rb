class CreateClientTypes < ActiveRecord::Migration
  def self.up
    create_table :client_types do |t|
      t.column :title, :string
      t.timestamps
    end
  end

  def self.down
    drop_table :client_types
  end
end
