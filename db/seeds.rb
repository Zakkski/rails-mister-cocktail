Dose.destroy_all
Ingredient.destroy_all
Cocktail.destroy_all

ingredients = JSON.parse(open('https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list').read)
ingredients['drinks'].each do |ingredient|
  Ingredient.create!(name: ingredient['strIngredient1'])
end

20.times do
  cocktail = Cocktail.create!(name: Faker::Superhero.unique.power)
  rand(6..10).times do
    dose = Dose.new(description: Faker::Science.element)
    dose.cocktail = cocktail
    dose.ingredient = Ingredient.all.sample
    dose.save!
  end
end
