class ProfileData < ActiveRecord::Base
  belongs_to :scheduler, :polymorphic => true

  def full_name
    "#{self.first_name} #{self.middle_name} #{self.last_name}"
  end

end


# == Schema Information
#
# Table name: profile_data
#
#  id             :integer(4)      not null, primary key
#  scheduler_id   :integer(4)
#  scheduler_type :string(255)
#  first_name     :string(255)
#  middle_name    :string(255)
#  last_name      :string(255)
#  birth_date     :datetime
#  home_address_1 :text
#  home_address_2 :text
#  city           :string(255)
#  zip            :integer(4)
#  home_phone     :text
#  cell_phone     :text
#  created_at     :datetime
#  updated_at     :datetime
#

