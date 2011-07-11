class CreateSkills < ActiveRecord::Migration
  def self.up
    create_table :skills do |t|
      t.column :registrant_id, :integer
      t.column :registrant_type, :string
      t.column :occupation_type_id, :integer
      t.timestamps
    end
  end

  def self.down
    drop_table :skills
  end
end
