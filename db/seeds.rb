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
decision_array = ["Yes", "No","Yes", "No","Yes", "No","Yes", "No","Yes", "No", "Yes", "No","Yes", "No","Yes", "No","Yes", "No","Yes", "No", "Yes", "No","Yes", "No","Yes", "No","Yes", "No","Yes", "No", "Yes", "No","Yes", "No","Yes", "No","Yes", "No","Yes", "No", "Yes", "No","Yes", "No","Yes", "No","Yes", "No","Yes", "No", "Yes", "No","Yes", "No","Yes", "No","Yes", "No","Yes", "No", "No Endorsement"]
group_array = ["Sierra Club", "Alice B. Toklas Democratic Club", "League of Pissed Off Voters"]

# Create Cities
city_array.each do |city| 
    City.create(name: city)
end

# Create Categories
sf_president = Category.create(title: "President")
sf_prop_k = Category.create(title: "Propositon")
sf_school_board = Category.create(title: "School Board")


# Create User for Me
m = User.create(
    city: City.all.first, 
    group: false, 
    name: "Matty Sallin", 
    email: "msallin@gmail.com", 
    password_digest: "yourmom", 
    admin: true,
    username: "msallin")

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
        admin: false,
        username: "")
    i += 1
end

# Create Users: Individuals
# city: City.all[id=1]
# 3.times do
#     User.create(
#         city: City.all.first, 
#         group: false, 
#         name: Faker::Name.name, 
#         email: Faker::Internet.email, 
#         password_digest: Faker::Internet.password, 
#         admin: false)
# end

# Create Choices
joe_biden = Choice.create(
    year: 2020, 
    season: "Fall", 
    city: City.all.first, 
    region: "National", 
    category: sf_president, 
    choice: "Joe Biden", 
    summary: "Biden prevailed over a crowded Democratic field with a largely moderate message of ending Trump-era partisan toxicity. His platform includes expanding government-sponsored health care options and a $2 trillion program to counter climate change.", 
    choice_type: "Choose 1", 
    result: nil)

donald_trump = Choice.create(
    year: 2020, 
    season: "Fall", 
    city: City.all.first, 
    region: "National", 
    category: sf_president, 
    choice: "Donald Trump", 
    summary: "Trump has focused on energizing his base throughout his nearly four years in office; supporters say he sticks to his promises. He's running as the savior of a pandemic-battered economy and guardian of an increasingly conservative federal bench.", 
    choice_type: "Choose 1", 
    result: nil)

prop_k = Choice.create(
    year: 2020, 
    season: "Fall", 
    city: City.all.first,  
    region: "State", 
    category: sf_prop_k, 
    choice: "K", 
    summary: "Would re-fund the California Institute for Regenerative Medicine, the state’s stem cell agency, by allowing it to issue $5.5 billion in bonds for research, training and facilities construction", 
    choice_type: "Yes/No", 
    result: nil)

matt_alexander = Choice.create(
    year: 2020, 
    season: "Fall", 
    city: City.all.first,  
    region: "Local", 
    category: sf_school_board, 
    choice: "Matt Alexander", 
    summary: "Alexander, an educator and organizer, said his top focus is “increasing revenue and allocating more funds directly to schools and classrooms.” He said the current school assignment system is not “sufficiently equitable and not producing integrated schools\”", 
    choice_type: "Choose 2 of 4", 
    result: nil)

jenny_lam = Choice.create(
    year: 2020, 
    season: "Fall", 
    city: City.all.first,  
    region: "Local", 
    category: sf_school_board, 
    choice: "Jenny Lam", 
    summary: "Lam, an incumbent and the mayor’s education adviser, said her top priority is “to meet the educational, health and well-being for all students, staff and families.” Lam said her criteria for changes to the assignment system include “equity, diversity, proximity and predictability for families.\”", 
    choice_type: "Choose 2 of 4", 
    result: nil)

mark_sanchez = Choice.create(
    year: 2020, 
    season: "Fall", 
    city: City.all.first,  
    region: "Local", 
    category: sf_school_board, 
    choice: "Mark Sanchez", 
    summary: "Sanchez, the board’s president and a public school teacher, said his main focus will be on addressing the “lack of appropriate funding.” Sanchez said that since Prop. 13 passed in 1978, the state has faced a “systemic, decades-long structural problem.” As for school assignment, he said he leans toward a system for up to four to six zones that incorporate choice.", 
    choice_type: "Choose 2 of 4", 
    result: nil)

michelle_parker = Choice.create(
    year: 2020, 
    season: "Fall", 
    city: City.all.first,  
    region: "Local", 
    category: sf_school_board, 
    choice: "Michelle Parker", 
    summary: "A parent and nonprofit director, Parker said her top priority is to get the district on “firm financial footing.” Parker said the district must focus on revenue generation through ballot measures and rental income from district property as well as advocacy for more state funding. She also wants a simpler assignment system that increases diversity.", 
    choice_type: "Choose 2 of 4", 
    result: nil)

# Create Decisions

i = 1
while i < User.all.length do 
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
