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
      subject(:board_col_full) { described_class.new }

      it 'returns false' do
        column = 1
        expect(board_col_full).not_to be_column_full(column)
      end
    end

    context 'when a column is full' do
      let(:node) { double('node') }
      subject(:board_col_full) { described_class.new }

      before do
        column = 1
        6.times do |i|
          board_col_full.instance_variable_get(:@board)[i][column] = node
        end
      end

      it 'returns true' do
        expect(board_col_full).to be_column_full(1)
      end
    end
  end

  describe '#win?' do
    context 'when board is empty' do
      subject(:board_win) { described_class.new }

      it 'does not send a message to check win' do
        expect(board_win).not_to receive(:check_win?)
        board_win.win?
      end

      it 'is not a win' do
        expect(board_win).not_to be_win
      end
    end

    context 'when board is filled with four pieces but it is not a win' do
      let(:node) { double('node')}
      subject(:board_win) { described_class.new }

      before do
        4.times do |i|
          board_win.instance_variable_get(:@board)[0][i] = node
        end
        allow(board_win).to receive(:check_win?)
      end

      it 'checks available pieces' do
        expect(board_win).to receive(:check_win?).with(node).exactly(4).times
        board_win.win?
      end

      it 'is not a win' do
        expect(board_win).not_to be_win
      end
    end

    context 'when board is filled with four pieces but it is a win' do
      let(:node) { double('node') }
      subject(:board_win) { described_class.new }

      before do
        4.times do |i|
          board_win.instance_variable_get(:@board)[0][i] = node
        end
        allow(board_win).to receive(:check_win?).and_return(true)
      end

      it 'is  a win' do
        expect(board_win).to be_win
      end
    end
  end
end