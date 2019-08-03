class Stat < ApplicationRecord
  validates :name, uniqueness: true
end
