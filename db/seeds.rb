# ５.time do |n|
  name = Faker::Movies::PrincessBride.name
  email = Faker::Internet.email
  password = "password"
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password,
               admin: true
               )
# end
