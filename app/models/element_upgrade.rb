class ElementUpgrade < ApplicationRecord

  def elementMath
    p1, p2 = combohash.split('$')
    return Element.find(p1.to_i).name + " + " + Element.find(p2.to_i).name
  end

  def displayName
    if name == ''
      return "Unnamed Element Upgrade: " + elementMath()
    else
      return name
    end
  end
end
