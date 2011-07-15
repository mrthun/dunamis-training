class CreateClntTypes < ActiveRecord::Migration
  def self.up
    create_table :clnt_types do |t|
      t.column :title, :string
      t.timestamps
    end
  end

  def self.down
    drop_table :clnt_types
  end
end
