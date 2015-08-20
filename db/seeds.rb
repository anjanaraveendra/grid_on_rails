# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


(51..100).each do |i|
	User.create(:first_name => "First Name #{i}",:last_name => "Last Name #{i}",:phone => rand.to_s[2..11] )
end	

