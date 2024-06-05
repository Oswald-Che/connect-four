# class to store information on game pieces
class Node
  def initialize(data = nil, colour = nil)
    @data = data
    @colour = colour
    @symbol = unicode_symbol(colour)
    @neighbours = []
  end

  def unicode_symbol(colour)
    colour == 'WHITE' ? "\u26AA" : "\u26AB"
  end


end