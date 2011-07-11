class CreateAssets < ActiveRecord::Migration
  def self.up
    create_table :assets do |t|
      t.column :user_id, :integer
      t.column :asset_file_name,    :string
      t.column :asset_content_type, :string
      t.column :asset_file_size,    :integer
      t.column :asset_updated_at,   :datetime
      t.column :asset_asset_type,   :string
      t.timestamps
    end
  end

  def self.down
    drop_table :assets
  end
end
