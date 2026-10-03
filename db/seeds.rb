# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

[
  { name: "AgriSurya Bharat", active: true },
  { name: "Example Cooperative", active: false }
].each do |attrs|
  Organization.find_or_create_by!(name: attrs[:name]) do |organization|
    organization.active = attrs[:active]
  end
end

if Rails.env.development?
  User.find_or_create_by!(email: "admin@agrisurya.test") do |user|
    user.first_name = "Admin"
    user.last_name = "User"
    user.super_admin = true
    user.password = "Password123!"
    user.password_confirmation = "Password123!"
  end
end
