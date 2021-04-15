class Director < ApplicationRecord
  validates :name, presence: true
  validates :dob, presence: true
  validates :country_of_birth, presence: true
end
