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
    board.reverse.each do |row|
      row.each do |piece|
        piece == empty ? print("#{empty} ") : print("#{piece.symbol} ")
      end
      print "\n"
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

  def column_empty?(col)
    board.each do |row|
      return true if row[col] == empty
    end
    false
  end

  def win?
    board.each do |row|
      row.each do |piece|
        next if piece == empty

        return true if check_win?(piece)
      end
    end
    false
  end

  # check if piece is a sequence with matching pieces
  def check_win?(piece)
    piece.neighbours.each_with_index do |pos, index|
      next if pos.nil?

      i, j = pos
      neighbour = board[i][j]
      return true if successive?(neighbour, index, piece.colour)
    end
    false
  end

  def successive?(piece, index, colour, count = 0)
    return false if piece.nil? || piece == empty || piece.colour != colour
    return true if count == 2

    count += 1
    i, j = piece.neighbours[index]
    return false if piece.neighbours[index].nil?

    piece = board[i][j]
    successive?(piece, index, colour, count)
  end

end

  
