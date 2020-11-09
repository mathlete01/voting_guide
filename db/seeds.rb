# Clear db before seeding
City.destroy_all
Region.destroy_all
User.destroy_all
Choice.destroy_all
Decision.destroy_all

# How many samples?
num = 10

# Sample data
city_array = ["San Francisco", "Los Angeles", "Seattle"]
region_array = ["Local", "Regional", "State", "Federal"]
category_array = ["Proposition A", "Proposition B", "Proposition C", "Proposition D", "Proposition E", "Proposition F", "Proposition G"]
decision_array = ["Yes", "No", "No Endorsement"]

# Create Cities
city_array.each do |city| 
    City.create(name: city)
end

# Create Regions
region_array.each do |region| 
    Region.create(name: region)
end

# Create Users
# city: City.all[id=1]
num.times do
    User.create(city: City.all.first, group: false, name: Faker::Name.name, email: Faker::Internet.email, password_digest: Faker::Internet.password, admin: false)
end

# Create Choices
num.times do
    Choice.create(year: 2020, season: "Fall", city: City.all.first, region: Region.all.sample, category: Faker::Job.title, choice: Faker::Name.name, summary: Faker::Lorem.paragraphs, choice_type: "Yes/No", result: nil)
end

# Create Decisions
num.times do
    Decision.create(user: User.all.sample, choice: Choice.all.sample, decision: decision_array.sample, link: Faker::Internet.url, annotation: Faker::Lorem.paragraphs)
end
