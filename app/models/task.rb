class Task < ApplicationRecord
  validates :name, presence: true, length: { maximum: 75 }
  validates :description, presence: true, length: { maximum: 400 }
  scope :task_name_like, -> task_name { where('name LIKE ?', "%#{task_name}%") }
  scope :status, -> status { where(status: status) }
end
