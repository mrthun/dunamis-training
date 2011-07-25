class Role < ActiveRecord::Base
  has_and_belongs_to_many :users

  attr_accessible :title

  def title=(value)
    write_attribute :title, (value ? value.downcase : nil)
  end

end



# == Schema Information
#
# Table name: roles
#
#  id    :integer(4)      not null, primary key
#  title :string(255)
#

