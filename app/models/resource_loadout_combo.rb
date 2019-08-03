class ResourceLoadoutCombo < ApplicationRecord
  belongs_to :resource
  belongs_to :offense_type
  validates :resource_id, uniqueness: {scope: :offense_type_id}
  validates :offense_type_id, uniqueness: {scope: :resource_id}

  def self.label
    return Resource.label + '-' + OffenseType.label + ' pairing'
  end
end
