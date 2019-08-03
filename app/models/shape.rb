class Shape < ApplicationRecord
  validates :name, uniqueness: true
end
