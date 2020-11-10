# Clear db before seeding
City.destroy_all
User.destroy_all
Category.destroy_all
Choice.destroy_all
Decision.destroy_all

# How many samples?
num = 10

# Sample data
city_array = ["San Francisco", "Los Angeles", "Seattle"]
region_array = ["Local", "Regional", "State", "Federal"]
decision_array = ["Yes", "No","Yes", "No","Yes", "No","Yes", "No","Yes", "No",  "No Endorsement"]
group_array = ["Sierra Club", "Alice B. Toklas Democratic Club", "Leage of Pissed Off Voters"]

# Create Cities
city_array.each do |city| 
    City.create(name: city)
end

# Create Categories
sf_president = Category.create(title: "President")
sf_prop_k = Category.create(title: "Propositon")
sf_school_board = Category.create(title: "School Board")

# Create Users: Groups
# city: City.all[id=1]
i = 0
while i < group_array.length do 
    User.create(
        city: City.all.first, 
        group: true, 
        name: group_array[i], 
        email: "",
        password_digest: "", 
        admin: false)
    i += 1
end

# Create Users: Individuals
# city: City.all[id=1]
3.times do
    User.create(
        city: City.all.first, 
        group: false, 
        name: Faker::Name.name, 
        email: Faker::Internet.email, 
        password_digest: Faker::Internet.password, 
        admin: false)
end

# Create Choices
joe_biden = Choice.create(
    year: 2020, 
    season: "Fall", 
    city: City.all.first, 
    region: "National", 
    category: sf_president, 
    choice: "Joe Biden", 
    summary: Faker::Lorem.paragraphs, 
    choice_type: "Choose 1", 
    result: nil)

donald_trump = Choice.create(
    year: 2020, 
    season: "Fall", 
    city: City.all.first, 
    region: "National", 
    category: sf_president, 
    choice: "Donald Trump", 
    summary: Faker::Lorem.paragraphs, 
    choice_type: "Choose 1", 
    result: nil)

prop_k = Choice.create(
    year: 2020, 
    season: "Fall", 
    city: City.all.first,  
    region: "State", 
    category: sf_prop_k, 
    choice: "K", 
    summary: Faker::Lorem.paragraphs, 
    choice_type: "Yes/No", 
    result: nil)

matt_alexander = Choice.create(
    year: 2020, 
    season: "Fall", 
    city: City.all.first,  
    region: "Local", 
    category: sf_school_board, 
    choice: "Matt Alexander", 
    summary: Faker::Lorem.paragraphs, 
    choice_type: "Choose 2 of 4", 
    result: nil)

jenny_lam = Choice.create(
    year: 2020, 
    season: "Fall", 
    city: City.all.first,  
    region: "Local", 
    category: sf_school_board, 
    choice: "Jenny Lam", 
    summary: Faker::Lorem.paragraphs, 
    choice_type: "Choose 2 of 4", 
    result: nil)

mark_sanchez = Choice.create(
    year: 2020, 
    season: "Fall", 
    city: City.all.first,  
    region: "Local", 
    category: sf_school_board, 
    choice: "Mark Sanchez", 
    summary: Faker::Lorem.paragraphs, 
    choice_type: "Choose 2 of 4", 
    result: nil)

michelle_parker = Choice.create(
    year: 2020, 
    season: "Fall", 
    city: City.all.first,  
    region: "Local", 
    category: sf_school_board, 
    choice: "Michelle Parker", 
    summary: Faker::Lorem.paragraphs, 
    choice_type: "Choose 2 of 4", 
    result: nil)

# Create Decisions

i = 0
while i < User.all.length do 
    #byebug
    j = 0
    while j < Choice.all.length do 
    Decision.create(
        user: User.find(i+1), 
        choice: Choice.find(j+1), 
        decision: decision_array.sample, 
        link: Faker::Internet.url, 
        annotation: Faker::Lorem.paragraphs)
        j += 1
    end
    i += 1
end
