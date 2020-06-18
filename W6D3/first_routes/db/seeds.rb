# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


ActiveRecord::Base.transaction do
  User.delete_all
  Artwork.delete_all
  ArtworkShare.delete_all
  

  brandon = User.create(
    username: "Brandon",
  )

  victor = User.create(
    username: "Victor",
  )

  dogs = Artwork.create(
    title: "Dogs",
    image_url: "https://www.google.com/images?=dogs",
    artist_id: brandon.id
  )

  pizzaball = Artwork.create(
    title: "Pizza Memorium",
    image_url: "https://www.google.com/images?=pizza",
    artist_id: victor.id
  )

  brandon_share = ArtworkShare.create(
    viewer_id: victor.id,
    artwork_id: dogs.id,
  )

  victor_share = ArtworkShare.create(
    viewer_id: brandon.id,
    artwork_id: pizzaball.id,
  )

  comment_one = Comment.create(
    body: "too many colors lmaooo",
    artwork_id: pizzaball.id,
    user_id: victor.id
  )

  comment_two = Comment.create(
    body: "it's a masterpiece",
    artwork_id: dogs.id,
    user_id: brandon.id
  )
end
