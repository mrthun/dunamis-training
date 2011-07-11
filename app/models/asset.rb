class Asset < ActiveRecord::Base
  has_attached_file :asset, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  belongs_to :user
end
