class Subdomain < ActiveRecord::Base
  belongs_to :user
  has_friendly_id :name, :use_slug => true, :strip_non_ascii => true
  validates_uniqueness_of :name, :case_sensitive => false
  validates :name , :presence => true
end

# == Schema Information
#
# Table name: subdomains
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  user_id    :integer(4)
#  created_at :datetime
#  updated_at :datetime
#

