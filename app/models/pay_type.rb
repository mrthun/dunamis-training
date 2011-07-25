class PayType < ActiveRecord::Base
  has_many :pays, :dependent => :destroy
  has_many :billing_datas, :dependent => :destroy

  attr_accessible :title

  def title=(value)
    write_attribute :title, (value ? value.downcase : nil)
  end
  
end



# == Schema Information
#
# Table name: pay_types
#
#  id         :integer(4)      not null, primary key
#  title      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

