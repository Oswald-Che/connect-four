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

end