# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.find_or_create_by!(id: 1, email: "sahidul03@gmail.com", phone: "+818013978923", name: "Islam Md Sahidul")


puts "START PREPARING POST DATA"
posts = []
(Date.new(2012, 01, 01)..Date.today).each do |date|
    posts << {user_id: 1, created_at: date, updated_at: date, body: Faker::Lorem.sentence, title: Faker::Lorem.sentence, status: "published"}
end
puts "END PREPARING POST DATA"

puts "NOW INSERTING ALL POST DATA"
Post.insert_all(posts)
puts "FINISHED INSERTING ALL POST DATA"