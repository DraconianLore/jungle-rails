# frozen_string_literal: true

require 'rails_helper'

describe Review, type: :model do
    user = User.new
  product = Product.new
  subject do
    described_class.new(description: 'anything', rating: 3, product: product, user: user)
  end

  it 'is vaild with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a description' do
    subject.description = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without arating' do
    subject.rating = nil
    expect(subject).to_not be_valid
  end

  it "belongs to a product" do
    assc = described_class.reflect_on_association(:product)
    expect(assc.macro).to eq :belongs_to
  end

  it "belongs to a user" do
    assc = described_class.reflect_on_association(:user)
    expect(assc.macro).to eq :belongs_to
  end
end
