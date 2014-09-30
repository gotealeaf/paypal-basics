# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Course.delete_all
Course.create name: "INTRODUCTION TO REPOSTERY (4 Weeks)", price: 475
Course.create name: "THE BEST BUTCHERY COURSE (4 Weeks)", price: 610
Course.create name: "SEA FOOD SECRETS COURSE (8 Weeks)", price: 1485
