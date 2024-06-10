require_relative 'board'
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

  def introduction
    puts 'Welcome to connect four'
    puts 'Input 1 to 7 place piece in column'
    puts 'White plays first'
  end

  def play
    swap_colour
    puts "#{colour}\'s turn"
    input = user_input
    board.update_board(input, colour)
    board.display
  end

  def swap_colour
    @colour = ( colour != 'WHITE' ? 'WHITE' : 'BLACK' )
  end

  def user_input
    loop do
      i = input.to_i - 1
      return i if check_input(i)

      puts 'Enter a number between 1 to 7 or In an empty column'
    end
  end

  def check_input(num)
    num.to_s.match?(/^[0-6]$/) && board.column_empty?(num)
  end

  def game_end
    @board.full? || @board.win?
  end

  def input
    gets.chomp
  end

  def final_message
    if @board.win?
      puts "Congratulations to #{colour} for winning the Game"
      puts 'Gme Over'
    elsif @board.full?
      puts 'Game board is full no moves left'
      puts 'Result is DRAW'
      puts 'Game Over'
    end
  end
end