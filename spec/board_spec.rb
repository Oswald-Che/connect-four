require './lib/board.rb'

# test for board class
describe Board do
  describe '#intitialize' do
  end

  describe '#update_board' do
    context 'when update board is called' do
      let(:node) {double('node')}
      subject(:board_update) { described_class.new }
      before do
        allow(Node).to receive(:new).and_return(node)
        allow(board_update).to receive(:find_row).and_return(1)
      end

      it 'adds element to board array' do
        expect(board_update.update_board(1, 'white')).to eq(node)
      end
    end
  end

  describe 'find_row' do
    context 'when board is empty and column is 1' do
      subject(:board_find) { described_class.new }

      it 'returns the first row' do
        column = 1
        expect(board_find.find_row(column)).to eq(0)
      end
    end

    context 'when column 1 is filled upto third row' do
      let(:node) { double('node')}
      subject(:board_find) { described_class.new }

      before do
        3.times do |i|
          board_find.instance_variable_get(:@board)[i][1] = node
        end
      end

      it 'return the fourth row' do
        column = 1
        expect(board_find.find_row(column)).to eq(3)
      end
    end
  end

  describe '#full?' do
    context 'when board is empty' do
      subject(:board_full) { described_class.new }

      it 'returns false' do
        expect(board_full).not_to be_full
      end
    end

    context 'when board is full' do
      let(:node) { double('node') }
      subject(:board_full) { described_class.new('__', Array.new(7, Array.new(6, node))) }

      it 'returns true' do
        expect(board_full).to be_full
      end
    end
  end

  describe '#column_full' do
    context 'when a column is empty' do
      subject(:game_col_full) { described_class.new }

      it 'returns false' do
        column = 1
        expect(game_col_full).not_to be_column_full(column)
      end
    end

    context 'when a column is full' do
      let(:node) { double('node') }
      subject(:game_col_full) { described_class.new }

      before do
        column = 1
        6.times do |i|
          game_col_full.instance_variable_get(:@board)[i][column] = node
        end
      end

      it 'returns true' do
        expect(game_col_full).to be_column_full(1)
      end
    end
  end
end