# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Museum.create(name: "Party Museum", blurb: "A Place to Party", description: "Millions of party exhibits and a ton of nacho cheese dip", address: "Chicago, IL")
Museum.create(name: "Museum of Boring", blurb: "It's so boring", description: "Millions of boring exhibits and a ton of infomercials and geometry lectures", address: "Spokane, WA")
Exhibit.create(name: "History of The Chugging Competition", blurb: "A look through the chugs of yore", description: "A walk backwards in time to the earliest beer drinking competitions as well as the modern party bros of today. Very informative.", museum_id: 1)
