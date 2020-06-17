# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
 
def rand_id
  rand(1..100_000)
end

ActiveRecord::Base.transaction do
  User.delete_all
  Artwork.delete_all
  ArtworkShare.delete_all
  

  brandon = User.create(
    id: rand_id,
    username: "Brandon",
  )

  victor = User.create(
    id: rand_id,
    username: "Victor",
    
  )

  dogs = Artwork.create(
    id: rand_id,
    title: "Dogs",
    image_url: "https://www.google.com/images?=dogs",
    artist_id: brandon.id
  )

  pizzaball = Artwork.create(
    id: rand_id,
    title: "Pizza Memorium",
    image_url: "https://www.google.com/images?=pizza",
    artist_id: victor.id
  )

  brandon_share = ArtworkShare.create(
    id: rand_id,
    artist_id: victor.id,
    artwork_id: dogs.id,
  )

  victor_share = ArtworkShare.create(
    id: rand_id,
    artist_id: brandon.id,
    artwork_id: pizzaball.id,
  )
end
