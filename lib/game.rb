# class to play game and recieve player inputs
class Game
  attr_reader :board, :colour
  def initialize(board = Board.new, colour = nil)
    @board = board
    @colour = colour
  end

  def start
    introduction
    play until game_end
    final_message
  end

  def play
    swap_colour
    input = user_input
    board.update_board(input, colour)
    board.display_board
  end

  def swap_colour
    @colour = ( colour != 'WHITE' ? 'WHITE' : 'BLACK' )
  end

end


