class ArmorType < ApplicationRecord
  validates :name, uniqueness: true
end
