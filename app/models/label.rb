class Label < ApplicationRecord
  has_many :tasks, through: :labellings, source: :task
  has_many :labellings, dependent: :destroy
end
