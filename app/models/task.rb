class Task < ApplicationRecord
  validates :name, presence: true, length: { maximum: 75 }
  validates :description, presence: true, length: { maximum: 400 }
end
