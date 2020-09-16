10.times do |n|
  name = Faker::Movies::PrincessBride.name
  email = Faker::Internet.email
  password = "password"
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password,
               admin: false
               )
end

User.create!(name: "AdminUser",
             email: "admin@example.com",
             password: 'password',
             password_confirmation: 'password',
             admin: true
             )

10.times do |n|
 Label.create!(name: "number#{n + 1}")
end

10.times do |n|
  Task.create!(
    name: "No.#{n + 1} task",
    description: 'task_detail',
    deadline: '2020-10-31',
    status: '未着手',
    priority: 1,
    user_id:  User.first.id + n
  )
end
