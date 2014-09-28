# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Course.delete_all
Course.create name: "INTRODUCTION TO RUBY AND WEB DEVELOPMENT (4 Weeks)", price: 475
Course.create name: "RAPID PROTOTYPING WITH RUBY ON RAILS (4 Weeks)", price: 610
Course.create name: "BUILD ROBUST AND PRODUCTION QUALITY APPLICATIONS (8 Weeks)", price: 1485
