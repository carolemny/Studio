# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Comment.destroy_all
User.destroy_all
Space.destroy_all
Booking.destroy_all
Category.destroy_all
JoinSpaceCategory.destroy_all
Conversation.destroy_all
Message.destroy_all

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
end

  dance_space = Space.new(
    host_id: User.all.sample.id,
    address: "Place du Château Rouge",
    city: "Paris",
    zip_code: "75018",
    description: "Je mets à disposition ma salle de danse 30 m² avec parquet en chêne. La salle dispose d'un large miroir et de barres de danse. Matériel son, avec possibilité de mettre votre musique avec téléphone ou clé USB.",
    title: 'Salle de danse',
    price: 40
  )
  dance_space.images.attach(io: File.open("app/assets/images/space/dance.jpg"), filename: "dance.jpg", content_type: 'image/jpg')
  dance_space.images.attach(io: File.open("app/assets/images/space/dance2.jpg"), filename: "dance2.jpg", content_type: 'image/jpg')
  dance_space.save

  paint_space = Space.new(
    host_id: User.all.sample.id,
    address: "52 rue Turenne",
    city: "Bordeaux",
    zip_code: "33000",
    description: "Espace de travail idéal pour peintre. Belle pièce de 17 m², lumineuse et aérée.La location comprend l'accès à un chevalet, tabouret et table de travail.",
    title: 'Atelier pour peintre',
    price: 15
  )
  paint_space.images.attach(io: File.open("app/assets/images/space/paint.jpg"), filename: "paint.jpg", content_type: 'image/jpg')
  paint_space.images.attach(io: File.open("app/assets/images/space/paint3.jpg"), filename: "paint3.jpg", content_type: 'image/jpg')
  paint_space.images.attach(io: File.open("app/assets/images/space/paint4.jpg"), filename: "paint4.jpg", content_type: 'image/jpg')
  paint_space.save

  music_space = Space.new(
    host_id: User.all.sample.id,
    address: "22 rue Nationale",
    city: "Lille",
    zip_code: "59000",
    description: "Musicien, je propose mon petit studio de musique avec tout le matériel nécessaire à l'enregistrement et au mixage.",
    title: "Studio d'enregistrement musique",
    price: 20
  )
  music_space.images.attach(io: File.open("app/assets/images/space/music.jpg"), filename: "music.jpg", content_type: 'image/jpg')
  music_space.images.attach(io: File.open("app/assets/images/space/music2.jpg"), filename: "music2.jpg", content_type: 'image/jpg')
  music_space.save

  video_space = Space.new(
    host_id: User.all.sample.id,
    address: "17 rue Marcadet",
    city: "Paris",
    zip_code: "75018",
    description: "Passionnée d'audiovisuel je propose mon espace vidéo aménagé. Vous pouvez utilisez les équipements suivants : Softbox pour l'éclairage, micro sans-fil, trépied et fond vert.",
    title: "Espace pour réalisation vidéo",
    price: 30
  )
  video_space.images.attach(io: File.open("app/assets/images/space/video.jpg"), filename: "video.jpg", content_type: 'image/jpg')
  video_space.images.attach(io: File.open("app/assets/images/space/video2.jpg"), filename: "video2.jpg", content_type: 'image/jpg')
  video_space.save

  photo_space = Space.new(
    host_id: User.all.sample.id,
    address: "121 rue Caulaincourt",
    city: "Paris",
    zip_code: "75018",
    description: "Magnifique studio pour photographes. Avec un fond blanc et des réflecteurs de lumières à disposition, cet espace est idéal pour la photographie de portraits, ou d'objets.",
    title: "Studio photo 19m²",
    price: 20
  )
  photo_space.images.attach(io: File.open("app/assets/images/space/photo.jpg"), filename: "photo.jpg", content_type: 'image/jpg')
  photo_space.images.attach(io: File.open("app/assets/images/space/photo2.jpg"), filename: "photo2.jpg", content_type: 'image/jpg')
  photo_space.save

  paint_space2 = Space.new(
    host_id: User.all.sample.id,
    address: "5 rue Poullain Duparc",
    city: "Rennes",
    zip_code: "35000",
    description: "Je propose mon petit atelier peinture, beaucoup de charme et tout ce dont vous avez besoin ! Possibilité d'utiliser le chevalet, l'évier et la table de travail.",
    title: "Espace idéal peinture 13m²",
    price: 15
  )
  paint_space2.images.attach(io: File.open("app/assets/images/space/paint6.jpg"), filename: "paint6.jpg", content_type: 'image/jpg')
  paint_space2.images.attach(io: File.open("app/assets/images/space/paint2.jpg"), filename: "paint2.jpg", content_type: 'image/jpg')
  paint_space2.save

  carpentry_space = Space.new(
    host_id: User.all.sample.id,
    address: "5 rue de l'Horloge",
    city: "Rennes",
    zip_code: "35000",
    description: "Passionné de menuiserie, je propose mon petit atelier à la location. Possibilité d'utiliser le matériel et la table de travail. Idéal pour bricolage ou petits travaux.",
    title: "Petit atelier de menuiserie",
    price: 20
  )
  carpentry_space.images.attach(io: File.open("app/assets/images/space/wood.jpg"), filename: "wood.jpg", content_type: 'image/jpg')
  carpentry_space.images.attach(io: File.open("app/assets/images/space/wood2.jpg"), filename: "wood2.jpg", content_type: 'image/jpg')
  carpentry_space.save

  pottery_space = Space.new(
    host_id: User.all.sample.id,
    address: "10 rue foch",
    city: "Montpellier",
    zip_code: "34000",
    description: "Je pratique la sculpture et propose mon atelier aménagé de 30m². Parfait pour réaliser de petites et moyennes pièces en pierre, terre cuite, céramique ... Outils de base, table de travail et évier à disposition.",
    title: "Atelier d'artiste sculpteur",
    price: 35
  )
  pottery_space.images.attach(io: File.open("app/assets/images/space/sculptor.jpg"), filename: "sculptor.jpg", content_type: 'image/jpg')
  pottery_space.images.attach(io: File.open("app/assets/images/space/sculptor2.jpg"), filename: "sculptor2.jpg", content_type: 'image/jpg')
  pottery_space.save

  pottery_space2 = Space.new(
    host_id: User.all.sample.id,
    address: "9 Boulevard Jean Moulin",
    city: "Nantes",
    zip_code: "44100",
    description: "Je pratique la poterie depuis peu et me suis aménagé mon espace de travail, dans une pièce dédiée de 14m². Possibilité d'utiliser les outils (rouleau, planche de bois, fil ...) mais je ne fournis pas l'argile. ",
    title: "Espace de travail idéal pour la poterie",
    price: 30
  )
  pottery_space2.images.attach(io: File.open("app/assets/images/space/pottery.jpg"), filename: "pottery.jpg", content_type: 'image/jpg')
  pottery_space2.images.attach(io: File.open("app/assets/images/space/pottery2.jpg"), filename: "pottery2.jpg", content_type: 'image/jpg')
  pottery_space2.images.attach(io: File.open("app/assets/images/space/pottery3.jpg"), filename: "pottery3.jpg", content_type: 'image/jpg')
  pottery_space2.save

  JoinSpaceCategory.create(
    category_id: Category.where(name: 'Danse').first.id,
    space_id: dance_space.id
  )

  JoinSpaceCategory.create(
    category_id: Category.where(name: 'Peinture').first.id,
    space_id: paint_space.id
  )

  JoinSpaceCategory.create(
    category_id: Category.where(name: 'Peinture').first.id,
    space_id: paint_space2.id
  )

  JoinSpaceCategory.create(
    category_id: Category.where(name: 'Musique').first.id,
    space_id: music_space.id
  )

  JoinSpaceCategory.create(
    category_id: Category.where(name: 'Vidéo').first.id,
    space_id: video_space.id
  )

  JoinSpaceCategory.create(
    category_id: Category.where(name: 'Photographie').first.id,
    space_id: photo_space.id
  )

  JoinSpaceCategory.create(
    category_id: Category.where(name: 'Sculpture - Poterie').first.id,
    space_id: pottery_space.id
  )

  JoinSpaceCategory.create(
    category_id: Category.where(name: 'Sculpture - Poterie').first.id,
    space_id: pottery_space2.id
  )

  JoinSpaceCategory.create(
    category_id: Category.where(name: 'Menuiserie').first.id,
    space_id: carpentry_space.id
  )

