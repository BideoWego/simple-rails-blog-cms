# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

author = Author.create({
	:first => 'Bideo',
	:last => 'Wego',
	:email => 'errors.chrisscavello@gmail.com',
	:password => 'password',
	:username => 'bideowego'
})

post = Post.create({
	:author_id => '1',
	:title => 'Sample Post',
	:content => 'Content goes here'
})