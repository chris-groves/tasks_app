class Task < ApplicationRecord
  belongs_to :user

  validates :description, presence: true
  validates :description, uniqueness: true
end
