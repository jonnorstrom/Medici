# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
Tagging.destroy_all
User.destroy_all
Event.destroy_all
Exhibit.destroy_all
Piece.destroy_all
Museum.destroy_all
Tag.destroy_all
## These are all the legitmate tags that Medici uses for their site

Tag.create(category: "Type of Museum", name: "Art")
Tag.create(category: "Type of Art", name: "Modern Art")
Tag.create(category: "Type of Art", name: "Contemporary Art")
Tag.create(category: "Type of Art", name: "European Art")
Tag.create(category: "Type of Art", name: "American Art")
Tag.create(category: "Type of Art", name: "Indian Art")
Tag.create(category: "Type of Art", name: "Asian Art")
Tag.create(category: "Type of Art", name: "African Art")
Tag.create(category: "Type of Art", name: "Decorative Arts")
Tag.create(category: "Type of Art", name: "Impressionism")
Tag.create(category: "Type of Art", name: "Abstract Expressionism")
Tag.create(category: "Type of Art", name: "Cubism")
Tag.create(category: "Type of Art", name: "Architecture")
Tag.create(category: "Type of Art", name: "Design")
Tag.create(category: "Type of Art", name: "Experimental")
Tag.create(category: "Type of Art", name: "Public Art")
Tag.create(category: "Medium", name: "Prints")
Tag.create(category: "Medium", name: "Drawing")
Tag.create(category: "Medium", name: "Painting")
Tag.create(category: "Medium", name: "Photography")
Tag.create(category: "Medium", name: "Film")
Tag.create(category: "Medium", name: "Performance")
Tag.create(category: "Medium", name: "Theater")
Tag.create(category: "Medium", name: "Dance")
Tag.create(category: "Medium", name: "Music")
Tag.create(category: "Medium", name: "Installation")

Tag.create(category: "Type of Museum", name: "Natural History")
Tag.create(category: "Type of Museum", name: "Ancient History")
Tag.create(category: "Type of Museum", name: "Ancient Culture")
Tag.create(category: "Type of Museum", name: "Anthropology")
Tag.create(category: "Type of Museum", name: "Arboretum")
Tag.create(category: "Type of Museum", name: "Archaeology")
Tag.create(category: "Type of Museum", name: "Science")
Tag.create(category: "Type of Museum", name: "Nature")
Tag.create(category: "Type of Museum", name: "Botanical Garden")
Tag.create(category: "Type of Museum", name: "History")
Tag.create(category: "Type of Museum", name: "Military")
Tag.create(category: "Type of Museum", name: "Science Museum")
Tag.create(category: "Type of Museum", name: "Technology")
Tag.create(category: "Type of Museum", name: "Industry")
Tag.create(category: "Type of Museum", name: "Transportation")
Tag.create(category: "Type of Museum", name: "Zoo")
Tag.create(category: "Type of Museum", name: "Planetarium")
Tag.create(category: "Type of Museum", name: "Aquarium")

Tag.create(category: "Misc", name: "Space")
Tag.create(category: "Misc", name: "Artist Talk")
Tag.create(category: "Misc", name: "Lecture")
Tag.create(category: "Misc", name: "Animals")
Tag.create(category: "Misc", name: "Dinosaur")
Tag.create(category: "Misc", name: "Conservation")
Tag.create(category: "Misc", name: "Trains")
Tag.create(category: "Misc", name: "Planes")
Tag.create(category: "Misc", name: "Oceanlife")
Tag.create(category: "Misc", name: "Wildlife")
Tag.create(category: "Misc", name: "Habitat")
Tag.create(category: "Misc", name: "Party")

## run 'rails c' and then query 'User.all' to find any given user's email address to login with
## all these users will be admin users, but the normal defualt is 'admin: false'

all_users = 8.times do
  User.create(
              first_name: Faker::Name.first_name,
              last_name: Faker::Name.last_name,
              email: Faker::Internet.email,
              admin: true,
              image_url: Faker::Avatar.image,
              password: "password"
              )
end


2.times do
  name = "#{Faker::Company.name} #{Faker::Company.suffix}"

  address = "#{Faker::Address.street_address} #{Faker::Address.street_suffix}, #{Faker::Address.city}, #{Faker::Address.state}, #{Faker::Address.zip_code}"

  Museum.create(
                name: name,
                blurb: Faker::ChuckNorris.fact,
                description: Faker::Hipster.paragraph(5),
                price: Faker::Number.decimal(2, 2),
                website: Faker::Internet.url,
                address: address,
                transportation_info: Faker::Lorem.sentence,
                opening_time: Time.now,
                closing_time: (Time.now + 20000),
                photo_file_name: Faker::Avatar.image
                )

  date = (DateTime.now + rand(12..20))

    Event.create(
                  name: Faker::University.name,
                  start_date: date,
                  end_date: date,
                  opening_time: Time.now,
                  closing_time: (Time.now + 60*100*2),
                  address: Museum.last.address,
                  blurb: Faker::ChuckNorris.fact,
                  description: Faker::Hipster.paragraph(5),
                  price: Faker::Number.decimal(2, 2),
                  museum_id: Museum.last.id,
                  website: Faker::Internet.url,
                  main: [true, false].sample,
                  ticketable: false,
                  max_price: 100,
                  photo_file_name: Faker::Avatar.image
                  )

  Exhibit.create(
                  name: Faker::University.name,
                  blurb: Faker::ChuckNorris.fact,
                  description: Faker::Hipster.paragraph(5),
                  price: Faker::Number.decimal(2, 2),
                  start_date: date,
                  end_date: date,
                  museum_id: Museum.last.id,
                  ticketsite: Faker::Internet.url,
                  photo_file_name: Faker::Avatar.image,
                  permanent: [true, false].sample
                  )

    Piece.create(
                  name: Faker::University.name,
                  blurb: Faker::ChuckNorris.fact,
                  description: Faker::Hipster.paragraph(5),
                  museum_id: Museum.last.id,
                  photo_file_name: Faker::Avatar.image,
                  )
end

2.times do
  Museum.all.each do |post|
    tag = Tag.all.sample
    Tagging.create(
                    user_id: User.last.id,
                    museum_id: post.id,
                    tag_id: tag.id
                    )
  end

  Event.all.each do |post|
    tag = Tag.all.sample
    Tagging.create(
                    user_id: User.last.id,
                    event_id: post.id,
                    tag_id: tag.id
                    )
  end

  Exhibit.all.each do |post|
    tag = Tag.all.sample
    Tagging.create(
                    user_id: User.last.id,
                    exhibit_id: post.id,
                    tag_id: tag.id
                    )
  end

  Piece.all.each do |post|
    tag = Tag.all.sample
    Tagging.create(
                    user_id: User.last.id,
                    piece_id: post.id,
                    tag_id: tag.id
                    )
  end
end
