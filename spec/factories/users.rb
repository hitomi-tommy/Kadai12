FactoryBot.define do
  factory :user do
    name { "test1" }
    email { "test1@power.com" }
    password { "testest" }
    admin { false }
  end

  factory :admin_user , class: User do
    name { "admin1" }
    email { "admin1@power.com" }
    password { "adminmin" }
    admin { true }
  end
end
