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

        return true if check_win?(item)
      end
    end
    false
  end

  def check_win?(item)
    item.neighbours.each_with_index do |pos, index|
      i, j = pos
      piece = board[i][j]
      return true if successive?(piece, index, item.coulour)
    end
    false
  end

  def successive?(piece, index, colour, count = 0)
    return false if piece == empty || piece.colour != colour
    return true if count == 3

    count += 1
    i, j = piece.neighbours[index]
    piece = board[i][j]
    successive?(piece, index, colour, count)
  end

end

  
