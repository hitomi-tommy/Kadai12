class Task < ApplicationRecord
  validates :name, presence: true, length: { maximum: 75 }
  validates :description, presence: true, length: { maximum: 400 }
  scope :task_name_like, -> name { where('name LIKE ?', "%#{name}%") }
  scope :status, -> status { where(status: status) }
end
