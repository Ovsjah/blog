# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories =  Category.create([
  {name: "Be brave stay wild.", description: "Cayote Peterson's adventures all over the world."},
  {name: "Rain forests in South America.", description: "Jungle around Amazon river are the lungs of planet Earth."},
  {name: "Coffee beans from around the world.", description: "All about coffee. If you like coffee and want to learn something new about this drink dive into the posts."}
])

posts = Post.create([
  {category_id: 1, name: "Cayote Peterson in Miami.", content: "Giant turtles of North America, alligators and snakes."},
  {category_id: 2, name: "Panthers and Jaguars.", content: "Panthers and jaguars live in South America in jungles of Amazon river."},
  {category_id: 2, name: "Amazon River Fishes.", content: "There are a lot of different kinds of fish in Amazon river."},
  {category_id: 3, name: "Arabica Java Coffee Beans.", content: "Java coffee is a wet processed (washed) coffee grown on the island of Java in Indonesia, mostly on the east side in the Ijen volcano complex on the Ijen Plateau at elevations around 1,400 meters."},
  {category_id: 3, name: "Robusta coffee beans.", content: "These beans are of a lower grade than Arabica, and are typically grown at lower elevations. They are easier to grow and maintain, and they are also more disease resistant and produce a higher yield. Robusta beans have more of an astringent flavor and contain a higher amount of caffeine."},
  {category_id: 3, name: "Arabica coffee beans.", content: "These are the higher quality beans and are referred to as gourmet coffee. They have half the amount of caffeine as Robusta and have more pleasing flavours and aromatic properties. Most Arabica bean varieties are name after their country or region in which they are found, or originated from."}
])

posts.first.file.attach(io: File.open('./spec/assets/dragon_tales.jpeg'), filename: 'dragon_tales.jpeg')
posts.second.file.attach(io: File.open('./spec/assets/panther_jaguar.jpeg'), filename: 'panther_jaguar.jpeg')
posts.third.file.attach(io: File.open('./spec/assets/piranha.jpeg'), filename: 'piranha.jpeg')
posts.fourth.file.attach(io: File.open('./spec/assets/java_coffee.jpeg'), filename: 'java_coffee.jpeg')
posts.fifth.file.attach(io: File.open('./spec/assets/robusta_beans.jpeg'), filename: 'robusta_beans.jpeg')
posts[5].file.attach(io: File.open('./spec/assets/arabica_beans.jpeg'), filename: 'arabica_beans.jpeg')
