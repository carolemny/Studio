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


5.times do
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    password: Faker::Internet.password(min_length: 6),
    email: Faker::Internet.email,
  )
end

7.times do |i|
  Category.create(
    name: categories[i]
  )
  i += 1
end

  space = Space.new(
    host_id: User.all.sample.id,
    city: cities.sample,
    description: 'Salle de danse 20m² avec miroirs et barre',
    title: 'Studio de danse'
  )
  space.images.attach(io: File.open("app/assets/images/space/danse.jpg"), filename: "danse.jpg", content_type: 'image/jpg')
  space.save

  space = Space.new(
    host_id: User.all.sample.id,
    city: cities.sample,
    description: 'Chevalet, tabouret et table de travail à disposition',
    title: 'Atelier pour peintre'
  )
  space.images.attach(io: File.open("app/assets/images/space/space.jpg"), filename: "space.jpg", content_type: 'image/jpg')
  space.save

  space = Space.new(
    host_id: User.all.sample.id,
    city: cities.sample,
    description: 'Matériel pour enregistrement et mixage ',
    title: "Studio d'enregistrement"
  )
  space.images.attach(io: File.open("app/assets/images/space/musique2.jpg"), filename: "musique2.jpg", content_type: 'image/jpg')
  space.save

  space = Space.new(
    host_id: User.all.sample.id,
    city: cities.sample,
    description: "Studio vidéo avec fond vert et matériel d'enregistrement",
    title: "Espace pour réalisation vidéo"
  )
  space.images.attach(io: File.open("app/assets/images/space/video.jpg"), filename: "video.jpg", content_type: 'image/jpg')
  space.save

  space = Space.new(
    host_id: User.all.sample.id,
    city: cities.sample,
    description: "Fond blanc et réflecteurs de lumière à dispo",
    title: "Studio photo 14m², idéal pour photographes"
  )
  space.images.attach(io: File.open("app/assets/images/space/photo.jpg"), filename: "photo.jpg", content_type: 'image/jpg')
  space.save

  space = Space.new(
    host_id: User.all.sample.id,
    city: cities.sample,
    description: "Parfait pour peintre, possibilité d'utiliser le chevalet, évier et table de travail",
    title: "Espace idéal peinture 10m²"
  )
  space.images.attach(io: File.open("app/assets/images/space/peinture6.jpg"), filename: "peinture6.jpg", content_type: 'image/jpg')
  space.save

  space = Space.new(
    host_id: User.all.sample.id,
    city: cities.sample,
    description: "Je mets à disposition mon atelier de menuiserie avec outils, idéal pour petits travaux",
    title: "Petit atelier de menuiserie"
  )
  space.images.attach(io: File.open("app/assets/images/space/menuiserie.jpg"), filename: "menuiserie.jpg", content_type: 'image/jpg')
  space.save

  space = Space.new(
    host_id: User.all.sample.id,
    city: cities.sample,
    description: "Atelier idéal pour petites sculptures, céramique ... outils et table de travail à disposition",
    title: "Atelier d'artiste sculpteur"
  )
  space.images.attach(io: File.open("app/assets/images/space/sculpture2.jpg"), filename: "sculpture2.jpg", content_type: 'image/jpg')
  space.save

  space = Space.new(
    host_id: User.all.sample.id,
    city: cities.sample,
    description: "Je mets à disposition mon matériel de poterie, dans une pièce dédiée de 11m².",
    title: "Espace idéal pour travail de la poterie"
  )
  space.images.attach(io: File.open("app/assets/images/space/poterie.jpg"), filename: "poterie.jpg", content_type: 'image/jpg')
  space.save


50.times do
  space = Space.all.sample
  Booking.create(
    guest_id: User.where.not(id: space.host_id).sample.id,
    space: space,
    duration: [30, 60, 90, 120, 180].sample,
    start_date: Time.now
  )
end


10.times do 
  JoinSpaceCategory.create(
    category_id: Category.all.sample.id, 
    space_id: Space.all.sample.id,
  )
end