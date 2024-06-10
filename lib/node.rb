# class to store information on game pieces
class Node
  attr_reader :pos, :colour, :symbol, :neighbours
  
  def initialize(pos, colour = nil)
    @pos = pos
    @colour = colour
    @symbol = unicode_symbol(colour)
    @neighbours = update_neighbours(@pos)
  end

  def unicode_symbol(colour)
    colour == 'WHITE' ? "\u26AA" : "\u26AB"
  end

  def update_neighbours(data, array = [])
    deltas.each do |item|
      ar = [data, item].transpose.map(&:sum)
      ar = ar[0].between?(0, 5) && ar[1].between?(0, 6) ? ar : nil 
      array << ar
    end
    array
  end

  def deltas
    [[-1, -1], [-1, 0], [-1, 1], [0, -1], [0, 1], [1, -1], [1, 0], [1, 1]]
  end
end