require './lib/node'

# test for node class
describe Node do
  describe '#initialize' do
  end

  describe '#unicode_symbol' do
    context 'when colour is white' do
      subject(:node_symbol) { described_class.new }

      it 'return the appropriate unicode symbol' do
        symbol = "\u26AA"
        result = node_symbol.unicode_symbol('WHITE')
        expect(result).to eq(symbol)
      end
    end
    context 'when colour is black' do
      subject(:node_symbol) { described_class.new }

      it 'return the appropriate unicode symbol' do
        symbol = "\u26AB"
        result = node_symbol.unicode_symbol('BLACK')
        expect(result).to eq(symbol)
      end
    end
  end

end