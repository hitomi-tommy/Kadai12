FactoryBot.define do
  factory :user do
    name { "Charlotte" }
    email { "charlotte@cuteness.com" }
    password { "daddy" }
    admin { true }
  end

  factory :second_user , class: User do
    name { "Loui" }
    email { "loui@cuteness.com" }
    password { "little" }
    admin { false }
  end
end
