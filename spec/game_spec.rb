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
      let(:board) { instance_double(Board, column_empty?: true)}
      subject(:game_check) { described_class.new(board) }

      it 'returns true' do
        input = 4
        result = game_check.check_input(input)
        expect(result).to be true
      end
    end

    context 'when an invalid input is given' do
      let(:board) { instance_double(Board, column_empty?: false) }
      subject(:game_check) { described_class.new(board) }

      it 'returns false' do
        invalid_input = 's'
        result = game_check.check_input(invalid_input)
        expect(result).to be false
      end
    end

    context 'when a valid input is given and column is filled' do
      let(:board) { instance_double(Board, column_empty?: false) }
      subject(:game_check) { described_class.new(board) }

      it 'returns false' do
        invalid_input = '4'
        result = game_check.check_input(invalid_input)
        expect(result).to be false
      end
    end
  end

  describe '#user_input' do
    context 'when user inputs a valid number' do
      let(:board) { instance_double(Board, column_empty?: true) }
      subject(:game_input) { described_class.new(board) }

      before do 
        valid_input = '5'
        allow(game_input).to receive(:input).and_return(valid_input)
      end

      it 'doesn\'t display error message' do
        expect(game_input).not_to receive(:puts)
        game_input.user_input
      end
    end

    context 'when user inputs an invalid number, then a valid number' do
      let(:board) { instance_double(Board, column_empty?: true) }
      subject(:game_input) { described_class.new(board) }

      before do
        letter = 's'
        valid_input = '5'
        allow(game_input).to receive(:input).and_return(letter, valid_input)
      end

      it 'displays error message once' do
        expect(game_input).to receive(:puts).once
        game_input.user_input
      end
    end
  end

  describe '#game_end' do
    let(:board) { instance_double(Board) }
    subject(:game_over) { described_class.new(board) }

    before do
      allow(board).to receive(:full?)
      allow(board).to receive(:win?)
    end

    it 'send full to board class' do
      expect(board).to receive(:full?)
      game_over.game_end
    end

    it 'send win to board class' do
      expect(board).to receive(:win?)
      game_over.game_end
    end
  end


end

