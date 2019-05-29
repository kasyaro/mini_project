# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

50.times do
    Coffee.create(
      name: Faker::Coffee.blend_name,
      origin: Faker::Coffee.origin,
      notes: Faker::Coffee.notes,
      img: Faker::Placeholdit.image("50x50"),
      price: Faker::Number.between(9, 75)
    )
  end
 
  100.times do
    Review.create(
        title: Faker::Book.title,
        content: Faker::Quote.famous_last_words,
        author: Faker::TvShows::Friends.character,
        coffee_id: Faker::Number.between(1, 50)
    )
  end