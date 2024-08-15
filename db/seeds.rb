# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Product.destroy_all
Cart.destroy_all
CartItem.destroy_all
User.destroy_all


if  Product.count.zero?
    10.times do
        v = Product.create(
        name: "product",
        price: "99.99",
        description: 'some product with some description',
        )
        v.image.attach(
        io:  File.open(File.join(Rails.root,'app/assets/images/banjo.jpg')),
        filename: 'photo.jpg',
        )
    end
end


User.create([{
    email: 'admin@email.com',
    password: 'password',
    admin: true
}])

