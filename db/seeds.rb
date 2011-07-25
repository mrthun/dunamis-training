# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
puts "Destroying all old user roles...."
roles = Role.all
roles.each{ |role| role.destroy } unless roles.blank?

puts "Destroying all old statuses...."
statuses = Status.all
statuses.each{ |status| status.destroy } unless statuses.blank?

puts "Destroying all old users...."
users = User.all
users.each{ |user| user.destroy } unless users.blank?

puts "Destroying all old occupation types...."
occupation_types = OccupationType.all
occupation_types.each{ |type| type.destroy } unless occupation_types.blank?

puts "Destroying all old contract types...."
contract_types = ContractType.all
contract_types.each{ |type| type.destroy } unless contract_types.blank?

puts "Destroying all old pay types...."
pay_types = PayType.all
pay_types.each{ |type| type.destroy } unless pay_types.blank?

puts "Destroying all old facility types...."
facility_types = FacilityType.all
facility_types.each{ |type| type.destroy } unless facility_types.blank?

puts "Creating default user roles...."
%w(admin organization registrant scheduler client).each do |title|
  Role.create!(:title => title)
end

puts "Creating default statuses...."
%w(active not_activated do_not_schedule missing_credentials missing_data lead contract on_hold).each do |title|
  Status.create!(:title => title)
end

puts "Creating default admin user...."
user = User.new(:email => "admin@dunamis.com",
  :password => "123456",
  :password_confirmation => "123456",
  :status_id => Status.find_by_title("active").id
)
user.roles << Role.find_by_title("admin")
user.skip_activation = true
user.save!
user.activate!

puts "Creating default occupation types...."
%w(nurse occupational_therapist physical_therapist speech_language_pathologist).each do |title|
  OccupationType.create!(:title => title)
end

puts "Creating default contract types...."
%w(W2 1099).each do |title|
  ContractType.create!(:title => title)
end

puts "Creating default pay types...."
%w(bank_transfer check cash credit_card).each do |title|
  PayType.create!(:title => title)
end

puts "Creating default facility types...."
%w(nursing_home hospital clinic).each do |title|
  FacilityType.create!(:title => title)
end