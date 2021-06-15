# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
users = [["youssef@domain.com", "Youssef"], ["john@domain.com", "John"], ["sarah@domain.com", "Sarah"], ["siham@domain.com", "Siham"]]
puts "start seeding users"
users.each do |user|
  User.create(name: user[1], email: user[0], password: "password", age: rand(25..50))
end

puts "seeding CATEGORIES"

categories = [
  {
    id: 1,
    name: "Furniture",
    icon: "floor-lamp",
    backgroundColor: "#fc5c65",
    color: "white"
  },
  {
    id: 2,
    name: "Cars",
    icon: "car",
    backgroundColor: "#fd9644",
    color: "white"
  },
  {
    id: 3,
    name: "Cameras",
    icon: "camera",
    backgroundColor: "#fed330",
    color: "white"
  },
  {
    id: 4,
    name: "Games",
    icon: "cards",
    backgroundColor: "#26de81",
    color: "white"
  },
  {
    id: 5,
    name: "Clothing",
    icon: "shoe-heel",
    backgroundColor: "#2bcbba",
    color: "white"
  },
  {
    id: 6,
    name: "Sports",
    icon: "basketball",
    backgroundColor: "#45aaf2",
    color: "white"
  },
  {
    id: 7,
    name: "Movies & Music",
    icon: "headphones",
    backgroundColor: "#4b7bec",
    color: "white"
  },
  {
    id: 8,
    name: "Books",
    icon: "book-open-variant",
    backgroundColor: "#a55eea",
    color: "white"
  },
  {
    id: 9,
    name: "Other",
    icon: "application",
    backgroundColor: "#778ca3",
    color: "white"
  }
]

categories.each do |category|
  Category.create(
    name: category[:name],
    icon: category[:icon],
    backgroundColor: category[:backgroundColor],
    color: category[:color]
  )
  puts "category seeded"
end

listings = [
  {
    id: 201,
    title: "Red jacket",
    images: [{ fileName: "jacket1" }],
    price: 100,
    categoryId: 5,
    userId: 1,
    location: {
      latitude: 37.78825,
      longitude: -122.4324
    }
  },
  {
    id: 3,
    title: "Gray couch in a great condition",
    images: [{ fileName: "couch2" }],
    categoryId: 1,
    price: 1200,
    userId: 2,
    location: {
      latitude: 37.78825,
      longitude: -122.4324
    }
  },
  {
    id: 1,
    title: "Room & Board couch (great condition) - delivery included",
    description:
      "I'm selling my furniture at a discount price. Pick up at Venice. DM me asap.",
    images: [
      { fileName: "couch1" },
      { fileName: "couch2" },
      { fileName: "couch3" },
    ],
    price: 1000,
    categoryId: 1,
    userId: 1,
    location: {
      latitude: 37.78825,
      longitude: -122.4324
    }
  },
  {
    id: 2,
    title: "Designer wear shoes",
    images: [{ fileName: "shoes1" }],
    categoryId: 5,
    price: 100,
    userId: 2,
    location: {
      latitude: 37.78825,
      longitude: -122.4324
    }
  },
  {
    id: 102,
    title: "Canon 400D (Great Condition)",
    images: [{ fileName: "camera1" }],
    price: 300,
    categoryId: 3,
    userId: 1,
    location: {
      latitude: 37.78825,
      longitude: -122.4324
    }
  },
  {
    id: 101,
    title: "Nikon D850 for sale",
    images: [{ fileName: "camera2" }],
    price: 350,
    categoryId: 3,
    userId: 1,
    location: {
      latitude: 37.78825,
      longitude: -122.4324
    }
  },
  {
    id: 4,
    title: "Sectional couch - Delivery available",
    description: "No rips no stains no odors",
    images: [{ fileName: "couch3" }],
    categoryId: 1,
    price: 950,
    userId: 2,
    location: {
      latitude: 37.78825,
      longitude: -122.4324
    }
  },
  {
    id: 6,
    title: "Brown leather shoes",
    images: [{ fileName: "shoes2" }],
    categoryId: 5,
    price: 50,
    userId: 2,
    location: {
      latitude: 37.78825,
      longitude: -122.4324
    }
  }
]

puts "start seeding listings"

listings.each do |listing|
  Listing.create!(
    title: listing[:title],
    image: "https://source.unsplash.com/random",
    category_id: listing[:categoryId],
    price: rand(50...350),
    user_id: rand(1...4),
    location: {
      latitude: listing[:location][:latitude],
      longitude: listing[:location][:longitude]
    }
    )
  puts "...listing..."
end

messages = ["Is this still available?", "I'm interested in this item. Do you provide free delivery?", "Please give me a call and we'll arrange this for you."]

messages.each do |message|
  Message.create!(
    user_id: rand(1...4),
    toUserId: rand(1...4),
    listing_id: 1,
    content: message
    )
  puts "Seeding ....messages"
end
