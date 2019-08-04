class Element < ApplicationRecord
  validates :name, uniqueness: true

  def getComboHash(element2)
    id1 = ''
    id2 = ''

    if id < element2.id
      id1 = id
      id2 = element2.id
    else
      id1 = element2.id
      id2 = id
    end

    return getUpgradeHash(id1) + '$' + getUpgradeHash(id2)
  end

  private
    def getUpgradeHash(s)
      return s.to_s.rjust(3, '0')
    end

end
