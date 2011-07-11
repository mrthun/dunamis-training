require 'test_helper'

class AssetTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end

# == Schema Information
#
# Table name: assets
#
#  id                 :integer(4)      not null, primary key
#  user_id            :integer(4)
#  asset_file_name    :string(255)
#  asset_content_type :string(255)
#  asset_file_size    :integer(4)
#  asset_updated_at   :datetime
#  asset_asset_type   :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#

