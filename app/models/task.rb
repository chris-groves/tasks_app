class Task < ApplicationRecord
  validates :description, presence: true
  validates :description, uniqueness: true                                                                                                                      
end
