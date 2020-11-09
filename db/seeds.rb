# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

City.destroy_all
Region.destroy_all
User.destroy_all
Choice.destroy_all
Decision.destroy_all

city_array = ["San Francisco", "Los Angeles", "Seattle"]

region_array = ["Local", "Regional", "State", "Federal"]

category_array = ["Proposition A", "Proposition B", "Proposition C", "Proposition D", "Proposition E", "Proposition F", "Proposition G"]

decision_array = ["Yes", "No", "No Endorsement"]

city_array.each do |city| 
    City.create(name: city)
end

region_array.each do |region| 
    Region.create(name: region)
end

# Create Users
# city: City.all[id=1]

3.times do
    User.create(city: City.all.first, group: false, name: Faker::Name.name, email: Faker::Internet.email, password_digest: Faker::Internet.password, admin: false)
end

# Create Choices
# year, season, city, region, category, choice, summary, choice_type, result
3.times do
    Choice.create(year: 2020, season: "Fall", city: City.all.first, region: Region.all.sample, category: Faker::Job.title, choice: Faker::Name.name, summary: Faker::Lorem.paragraphs, choice_type: "Yes/No", result: nil)
end

# Create Decisions
# user_id, choice_id, decision, link, annotation
3.times do
    Decision.create(user: User.all.sample, choice: Choice.all.sample, decision: decision_array.sample, link: Faker::Internet.url, annotation: Faker::Lorem.paragraphs)
end


