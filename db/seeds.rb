# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.delete_all

admin = User.create!(
name: 'Admin',
email: 'admin@example.com',
password: 'password',
admin: true,
advanced: true
)

advanced = User.create!(
name: 'Advanced',
email: 'advanced@example.com',
password: 'password'
)

member = User.create!(
name: 'Member',
email: 'member@example.com',
password: 'password'
)
