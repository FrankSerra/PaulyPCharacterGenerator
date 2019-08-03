class Resource < ApplicationRecord
  validates :name, uniqueness: true
end
