FactoryBot.define do
  factory :label do
    name { "Monday" }
  end
  factory :second_label, class: Label do
    name { "Friday" }
  end
end
