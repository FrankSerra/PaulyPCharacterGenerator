class Race < ApplicationRecord
  validates :name, uniqueness: true
end
