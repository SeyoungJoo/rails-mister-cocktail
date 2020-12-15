# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Ingredient.create(name: "lemon")
Ingredient.create(name: "ice")
Ingredient.create(name: "sugar syrup")
Ingredient.create(name: "mint leaves")
Ingredient.create(name: "london dry gin")
Ingredient.create(name: "orange juice")
Ingredient.create(name: "Vodka")

require 'json'

filepath = 'cocktail.json'

serialized_cocktails = File.read("cocktail.json")

beers = JSON.parse(serialized_beers)

beers[drinks] each do |cocktail|
puts Ingredient.create(name:cocktail.stringgredient1)
end
