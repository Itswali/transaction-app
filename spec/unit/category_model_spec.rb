RSpec.describe Category, type: :model do
  describe 'validations' do
    it 'is valid with a name and icon' do
      category = Category.new(name: 'Category 1', icon: 'https://example.com/icon.png')
      expect(category).to be_valid
    end
  end
end
