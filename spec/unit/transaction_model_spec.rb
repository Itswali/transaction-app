RSpec.describe Transaction, type: :model do
  describe 'validations' do
    it 'is valid with a name, amount, and category' do
      category = Category.create(name: 'Category 1', icon: 'https://example.com/icon.png')
      transaction = Transaction.new(name: 'Transaction 1', amount: 10.0, category:)
      expect(transaction).to be_valid
    end

    it 'is invalid without a category' do
      transaction = Transaction.new(name: 'Transaction 1', amount: 10.0)
      expect(transaction).not_to be_valid
      expect(transaction.errors[:category]).to include('must exist')
    end
  end
end
