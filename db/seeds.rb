# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Space.destroy_all
Booking.destroy_all
Category.destroy_all
JoinSpaceCategory.destroy_all

cities = ["Paris", "Lyon", "Marseille", "Toulouse", "Lille", "Strasbourg", "Grenoble", "Nice", "Rennes", "Brest", "Bordeaux", "Biarritz", "Montpellier", "Nantes", "Clermont-Ferrant", "Caen", "Limoges", "Auxerre", "Dijon", "Tours", "Chartres"]

categories = ["Peinture", "Sculpture - Poterie", "Danse", "Musique", "Menuiserie", "Photographie", "Vidéo"]

20.times do
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    password: Faker::Internet.password(min_length: 6),
    email: Faker::Internet.email,
  )
end

20.times do
  space = Space.create(
    host_id: User.all.sample.id,
    city: cities.sample,
    description: Faker::Lorem.sentence(word_count: 10),
    title: Faker::Lorem.sentence(word_count: 3)
  )
  space.images.attach(io: File.open("app/assets/images/space/space.jpg"), filename: "space.jpg", content_type: 'image/jpg')
end

200.times do
  space = Space.all.sample
  Booking.create(
    guest_id: User.where.not(id: space.host_id).sample.id,
    space: space,
    duration: [30, 60, 90, 120, 180].sample,
    start_date: Time.now
  )
end

7.times do |i|
  Category.create(
    name: categories[i]
  )
  i += 1
end

50.times do
  JoinSpaceCategory.create(
    category_id: Category.all.sample.id, 
    space_id: Space.all.sample.id
  )
end