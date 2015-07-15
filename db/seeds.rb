# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(username: 'Joey',password: 'test',email: 'Joey@test.com',phone: '123-456-7890',firstname: 'Joey',lastname: 'Jones')
User.create(username: 'Abe',password: 'test',email: 'Abe@test.com',phone: '323-286-0011',firstname: 'Abe',lastname: 'Lincoln')
User.create(username: 'Kev',password: 'test',email: 'Kev@test.com',phone: '800-209-0002',firstname: 'Kev',lastname: 'Smith')



