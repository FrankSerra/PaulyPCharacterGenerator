class Element < ApplicationRecord
  validates :name, uniqueness: true
end
