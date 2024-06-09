require './lib/game.rb'

# test for game class

describe Game do
  describe '#initialize' do
  end

  describe '#start' do
  end

  describe '#introduction' do
  end

  describe '#play' do 
  end

  describe '#swap_colour' do
    context 'when player is white' do
      let(:board) { double('board') }
      subject(:game_swap) { described_class.new(board, 'WHITE')}

      it 'returns black' do
        result = game_swap.swap_colour
        expect(result).to eq('BLACK')
      end
    end

    context 'when player is black' do
      let(:board) { double('board') }
      subject(:game_swap) { described_class.new(board, 'BLACK')}

      it 'returns white' do
        result = game_swap.swap_colour
        expect(result).to eq('WHITE')
      end
    end
  end

  describe '#check_input' do
    context 'when a valid input is given and column is empty' do
      let(:board) { instance_double(Board, column_full?: true)}
      subject(:game_check) { described_class.new(board) }

      it 'returns true' do
        input = '4'
        result = game_check.check_input(input)
        expect(result).to be true
      end
    end

    context 'when an invalid input is given' do
      let(:board) { instance_double(Board, column_full?: false) }
      subject(:game_check) { described_class.new(board) }

      it 'returns false' do
        invalid_input = 's'
        result = game_check.check_input(invalid_input)
        expect(result).to be false
      end
    end

    context 'when a valid input is given and column is filled' do
      let(:board) { instance_double(Board, column_full?: false) }
      subject(:game_check) { described_class.new(board) }

      it 'returns false' do
        invalid_input = '4'
        result = game_check.check_input(invalid_input)
        expect(result).to be false
      end
    end
  end


end