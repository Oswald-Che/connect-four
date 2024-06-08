require_relative 'node'
# class to board pieces
class Board
  attr_reader :board, :empty

  def initialize(empty = '__', board = Array.new(6) { Array.new(7, empty) })
    @empty = empty
    @board = board
  end

  def update_board(col, colour)
    row = find_row(col)
    @board[row][col] = Node.new([row, col], colour)
  end

  def display
    board.each do |row|
      puts row.join(' ')
    end
  end

  def find_row(col)
    board.each_with_index do |row, i|
      return i if row[col] == empty
    end
  end

  def full?
    board.flatten.none?(empty)
  end

  def column_full?(col)
    board.each do |row|
      return false if row[col] == empty
    end
    true
  end

  def win?
    board.each do |row|
      row.each do |item|
        next if item == empty

        return true if metho(item)
      end
    end
    false
  end

end

  
