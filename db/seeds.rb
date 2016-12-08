# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).


## These are all the legitmate tags that Medici uses for their site

# Tag.create(category: "Type of Museum", name: "Art")
# Tag.create(category: "Type of Art", name: "Modern Art")
# Tag.create(category: "Type of Art", name: "Contemporary Art")
# Tag.create(category: "Type of Art", name: "European Art")
# Tag.create(category: "Type of Art", name: "American Art")
# Tag.create(category: "Type of Art", name: "Indian Art")
# Tag.create(category: "Type of Art", name: "Asian Art")
# Tag.create(category: "Type of Art", name: "African Art")
# Tag.create(category: "Type of Art", name: "Decorative Arts")
# Tag.create(category: "Type of Art", name: "Impressionism")
# Tag.create(category: "Type of Art", name: "Abstract Expressionism")
# Tag.create(category: "Type of Art", name: "Cubism")
# Tag.create(category: "Type of Art", name: "Architecture")
# Tag.create(category: "Type of Art", name: "Design")
# Tag.create(category: "Type of Art", name: "Experimental")
# Tag.create(category: "Type of Art", name: "Public Art")
# Tag.create(category: "Medium", name: "Prints")
# Tag.create(category: "Medium", name: "Drawing")
# Tag.create(category: "Medium", name: "Painting")
# Tag.create(category: "Medium", name: "Photography")
# Tag.create(category: "Medium", name: "Film")
# Tag.create(category: "Medium", name: "Performance")
# Tag.create(category: "Medium", name: "Theater")
# Tag.create(category: "Medium", name: "Dance")
# Tag.create(category: "Medium", name: "Music")
# Tag.create(category: "Medium", name: "Installation")
#
# Tag.create(category: "Type of Museum", name: "Natural History")
# Tag.create(category: "Type of Museum", name: "Ancient History")
# Tag.create(category: "Type of Museum", name: "Ancient Culture")
# Tag.create(category: "Type of Museum", name: "Anthropology")
# Tag.create(category: "Type of Museum", name: "Arboretum")
# Tag.create(category: "Type of Museum", name: "Archaeology")
# Tag.create(category: "Type of Museum", name: "Science")
# Tag.create(category: "Type of Museum", name: "Nature")
# Tag.create(category: "Type of Museum", name: "Botanical Garden")
# Tag.create(category: "Type of Museum", name: "History")
# Tag.create(category: "Type of Museum", name: "Military")
# Tag.create(category: "Type of Museum", name: "Science Museum")
# Tag.create(category: "Type of Museum", name: "Technology")
# Tag.create(category: "Type of Museum", name: "Industry")
# Tag.create(category: "Type of Museum", name: "Transportation")
# Tag.create(category: "Type of Museum", name: "Zoo")
# Tag.create(category: "Type of Museum", name: "Planetarium")
# Tag.create(category: "Type of Museum", name: "Aquarium")
#
# Tag.create(category: "Misc", name: "Space")
# Tag.create(category: "Misc", name: "Artist Talk")
# Tag.create(category: "Misc", name: "Lecture")
# Tag.create(category: "Misc", name: "Animals")
# Tag.create(category: "Misc", name: "Dinosaur")
# Tag.create(category: "Misc", name: "Conservation")
# Tag.create(category: "Misc", name: "Trains")
# Tag.create(category: "Misc", name: "Planes")
# Tag.create(category: "Misc", name: "Oceanlife")
# Tag.create(category: "Misc", name: "Wildlife")
# Tag.create(category: "Misc", name: "Habitat")
# Tag.create(category: "Misc", name: "Party")

## run 'rails c' and then query 'User.all' to find any given user's email address to login with
## all these users will be admin users, but the normal defualt is 'admin: false'

# all_users = 8.times do
#   User.create(
#               first_name: Faker::Name.first_name,
#               last_name: Faker::Name.last_name,
#               email: Faker::Internet.email,
#               admin: true,
#               image_url: Faker::Avatar.image,
#               password: "password"
#               )
# end

all_museums = 3.times do
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
                closing_time: (Time.now + 20000)
                )
  # Event.create(
  #               name:
  #               )
end
