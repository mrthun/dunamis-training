class ClientType < ActiveRecord::Base
  has_many :basic_data, :dependent => :destroy

  attr_accessible :title

  def title=(value)
    write_attribute :title, (value ? value.downcase : nil)
  end

end

# == Schema Information
#
# Table name: client_types
#
#  id         :integer(4)      not null, primary key
#  title      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

