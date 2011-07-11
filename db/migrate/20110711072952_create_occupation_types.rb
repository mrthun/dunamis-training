class CreateOccupationTypes < ActiveRecord::Migration
  def self.up
    create_table :occupation_types do |t|
      t.column :title, :string
      t.timestamps
    end
  end

  def self.down
    drop_table :occupation_types
  end
end
