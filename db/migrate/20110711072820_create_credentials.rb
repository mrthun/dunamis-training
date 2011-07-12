class CreateCredentials< ActiveRecord::Migration
  def self.up
    create_table :credentials do |t|
      t.column :registrant_id, :integer
      t.column :license_expiration_date, :datetime
      t.column :insurance_expiration_date, :datetime
      t.column :health_exam_1_title, :text
      t.column :health_exam_1_date, :datetime
      t.column :health_exam_2_title, :text
      t.column :health_exam_2_date, :datetime

      t.timestamps
    end
  end

  def self.down
    drop_table :credential
  end
end
