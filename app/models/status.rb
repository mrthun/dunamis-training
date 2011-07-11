class Status < ActiveRecord::Base
  has_many :users, :dependent => :destroy

  attr_accessible :title

  def title=(value)
    write_attribute :title, (value ? value.downcase : nil)
  end

end

# == Schema Information
#
# Table name: statuses
#
#  id         :integer(4)      not null, primary key
#  title      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

