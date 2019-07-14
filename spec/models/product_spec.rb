require 'rails_helper'

describe Product, :type => :model do
    it 'is vaild with valid attributes' do
        expect(Product.new(name: 'Anything', price: 2, category: Category.new, quantity: 1)).to be_valid
    end

    it 'is not valid without a name' do
        product = Product.new(name: nil)
        expect(product).to_not be_valid
    end

    it 'is not valid without a price' do
        product = Product.new(price: nil)
        expect(product).to_not be_valid
    end

    it 'is not valid without a category' do
        product = Product.new(category_id: nil)
        expect(product).to_not be_valid
    end

    it 'is not valid without a quantity' do
        product = Product.new(quantity: nil)
        expect(product).to_not be_valid
    end

  it "belongs to a category" do
    assc = described_class.reflect_on_association(:category)
    expect(assc.macro).to eq :belongs_to
  end
end
