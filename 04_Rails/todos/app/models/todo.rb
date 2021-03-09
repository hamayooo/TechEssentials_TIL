class Todo < ApplicationRecord
  validates :name, presence: true
  validates :name, length: {maximum: 30}
end
