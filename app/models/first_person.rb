class FirstPerson < ApplicationRecord
  validates :name, presence: true, uniqueness: true
end
