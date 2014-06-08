# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# ProjectTypes
puts 'Inserting ProjectTypes...'.colorize(:green)
ProjectType.create(:name => 'education')
ProjectType.create(:name => 'search')
ProjectType.create(:name => 'extension')
puts '...ProjectTypes inserteds.'.colorize(:light_blue)
# /ProjectTypes