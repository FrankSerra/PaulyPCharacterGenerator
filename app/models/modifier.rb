class Modifier < ApplicationRecord
  validates :name, uniqueness: true
end
