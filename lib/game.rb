# class to play game and recieve player inputs
class Game
  def initialize(board = Board.new)
    @board = board
    @colour = nil
  end

  def start
    introduction
    play until game_end
    final_message
  end

  def play
    swap_player
    input = user_input
    board.update_board(input, colour)
    board.display_board
  end

end


