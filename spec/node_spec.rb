require './lib/node'

# test for node class
describe Node do
  describe '#initialize' do
  end

  describe '#unicode_symbol' do
    context 'when colour is white' do
      subject(:node_symbol) { described_class.new([0, 0]) }

      it 'return the appropriate unicode symbol' do
        symbol = "\u26AA"
        result = node_symbol.unicode_symbol('WHITE')
        expect(result).to eq(symbol)
      end
    end
    context 'when colour is black' do
      subject(:node_symbol) { described_class.new([0, 0]) }

      it 'return the appropriate unicode symbol' do
        symbol = "\u26AB"
        result = node_symbol.unicode_symbol('BLACK')
        expect(result).to eq(symbol)
      end
    end
  end

  describe '#update_neighbours' do
    context 'when peice position is 0, 0' do
      subject(:node_neighbour) { described_class.new([0, 0]) }

      it 'returns positions of its neighbours' do
        pos = [0, 0]
        neighbours = [[0, 1], [1, 0], [1, 1]]
        result = node_neighbour.update_neighbours(pos).compact
        expect(result).to eq(neighbours)
      end
    end

    context 'when peice position is 7, 4' do
      subject(:node_neighbour) { described_class.new([7, 4]) }

      it 'returns positions of its neighbours' do
        pos = [5, 6]
        neighbours = [[4, 5], [4, 6], [5, 5]]
        result = node_neighbour.update_neighbours(pos).compact
        expect(result).to eq(neighbours)
      end
    end

    context 'when peice position is 3, 3' do
      subject(:node_neighbour) { described_class.new([3, 3]) }

      it 'returns positions of its neighbours' do
        pos = [3, 3]
        neighbours = [[2, 2], [2, 3], [2, 4], [3, 2], [3, 4], [4, 2], [4, 3], [4, 4]]
        result = node_neighbour.update_neighbours(pos).compact
        expect(result).to eq(neighbours)
      end
    end
  end

end