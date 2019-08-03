class Resource < ApplicationRecord
  validates :name, uniqueness: true

  def calculation
    if addstatline == true && subtractstatline == true
      return "Fixed value"
    elsif addstatline == true
      return "Base + stat excess"
    elsif subtractstatline == true
      return "Base - stat excess"
    else
      return "Fixed value"
    end
  end

  def getsSpell(sayno = true)
    return (generatespell == true ? 'Yes' : (sayno == true ? 'No' : '-'))
  end
end
