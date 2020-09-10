class Task < ApplicationRecord
  validates :name, presence: true, length: { maximum: 75 }
  validates :description, presence: true, length: { maximum: 400 }
  scope :task_name_like, -> name { where('name LIKE ?', "%#{name}%") }
  scope :status, -> status { where(status: status) }
  enum priority:{ 高: 0, 中: 1, 低: 2 }
end
