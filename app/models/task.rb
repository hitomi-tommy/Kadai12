class Task < ApplicationRecord
  validates :name, presence: true
  validates :name, length: { maximum: 75 }
  validates :description, presence: true
  validates :description, length: { maximum: 400 }
end
