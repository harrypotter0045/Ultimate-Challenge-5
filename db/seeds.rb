# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "csv"

Product.destroy_all

Category.destroy_all

csv_file = Rails.root.join("db/products.csv")
csv_data = File.read(csv_file)

products = CSV.parse(csv_data, headers: true)

products.each do |p|
  category = Category.find_or_create_by(name: p["category"])
  if category&.valid?
    product = category.products.create(
      title:          p["name"],
      price:          p["price"],
      stock_quantity: p["stock quantity"],
      description:    p["description"]
    )

    puts product.inspect unless product&.valid?
    puts category.inspect unless product&.valid?
    puts "Invald product #{p['name']}" unless product&.valid?
    puts product.errors.messages.inspect unless product&.valid?
  else
    puts "Invalid category #{p['category']} for product #{p['name']}."
  end
end

puts "Created #{Category.count}"
puts "Created #{Product.count}"
