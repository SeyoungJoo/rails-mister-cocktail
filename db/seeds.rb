# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'
require 'open-uri'
require 'faker'

Cocktail.destroy_all
Ingredient.destroy_all
Dose.destroy_all

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'

buffer = open(url).read

ingredients = JSON.parse(buffer)

all_ingredients = []

ingredients["drinks"].each do |ingredient|
  ingredient_created = Ingredient.create(name: ingredient["strIngredient1"])
  all_ingredients << ingredient_created
end

7.times do
  attributes = {
    name: Faker::Coffee.blend_name,
    description: Faker::Coffee.notes,
    img_url: ['https://images.unsplash.com/photo-1556855810-ac404aa91e85?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=634&q=80', 'https://images.unsplash.com/photo-1563223771-5fe4038fbfc9?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80', 'https://images.unsplash.com/photo-1550426735-c33c7ce414ff?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=620&q=80', 'https://images.unsplash.com/photo-1583898350903-99fa829dad3d?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=658&q=80', 'https://images.unsplash.com/photo-1578664182354-e3878189cdac?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80', 'https://images.unsplash.com/photo-1553607558-455f4310f6ec?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=636&q=80', 'https://images.unsplash.com/photo-1599021456807-25db0f974333?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=679&q=80', 'https://images.unsplash.com/photo-1560508179-b2c9a3f8e92b?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80'].sample
  }


  cocktail = Cocktail.create!(attributes)

  5.times do
  one_ingredient = all_ingredients.sample

  doses_attributes = {
    description: "#{rand(1..5)} #{["handful", "part"].sample}",
    cocktail: cocktail,
    ingredient: one_ingredient
  }

  dose = Dose.create!(doses_attributes)

  puts "created #{cocktail.name} with #{dose.description} of #{one_ingredient.name}"
  end
end
