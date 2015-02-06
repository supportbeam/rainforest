Product.create!(
  :name  => "Thermal Mug",
  :description => "BPA free and keeps your coffee or tea hot!",
  :price_in_cents    => 500
)

Product.create!(
  :name  => "Glass Food Container",
  :description => "BPA free and leak proof!",
  :price_in_cents    => 1000
)

Product.create!(
  :name  => "Lip Balm",
  :description => "All natural ingredients and leaves your lips supple soft!",
  :price_in_cents    => 300
)

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
