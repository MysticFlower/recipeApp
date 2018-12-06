# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
def seed_users
  user_id = 0
  2.times do
    User.create(
      name: "shabeena",
      email: "shabeena@recipeapp.com",
      password: '123456',
      password_confirmation: '123456'
    )
  end
end


def seed_categories
  vegetarian = ['Breakfast', 'Lunch', 'Dinner','Desert', 'Snacks', 'Soups', 'Salads', 'Smoothies', 'Other']
  non_vegetarian = ['chicken', 'Boiled Shrimps','Other']
  vegan = ['salsa', 'syrup','Other']

  vegetarian.each do |name|
    Category.create(branch: 'vegetarian', name: name)
  end

  non_vegetarian.each do |name|
    Category.create(branch: 'non_vegetarian', name: name)
  end

  vegan.each do |name|
    Category.create(branch: 'vegan', name: name)
  end
end

def seed_posts
  categories = Category.all

  categories.each do |category|
    2.times do
      Post.create(
        title: Faker::Food.dish, 
        content: Faker::Food.description, 
        # description: Faker::Food.ingredient,
        # direction: Faker::Food.measurement,
        user_id: rand(1..9), 
        category_id: category.id
      )
    end
  end
end

def seed_ingredients
  posts = Post.all

  posts.each do |post|
    2.times do
      Ingredient.create(
        description: Faker::Food.ingredient,
        post_id: post.id
      )
    end
  end
end

def seed_steps
  posts = Post.all

  posts.each do |post|
    2.times do
      Step.create(
        direction: Faker::Food.measurement,
        post_id: post.id
      )
    end
  end
end

seed_users
seed_categories
seed_posts
seed_ingredients
seed_steps
