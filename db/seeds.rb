# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'random_data'

  10.times do
    User.create!(
      email: RandomData.random_email,
      password: "password",
      role: "standard"
      )
  end

  users = User.all

  50.times do
    Wiki.create!(
      title: RandomData.random_sentence,
      body: RandomData.random_paragraph,
      private: false,
      user: users.sample
    )
  end

  wikis = Wiki.all

  puts "Seeding finished"
  puts "#{users.count} users created"
  puts "#{wikis.count} wikis created"
