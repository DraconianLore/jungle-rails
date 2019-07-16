require 'rails_helper'

RSpec.feature "Visitor navigates to product page", type: :feature, js: true do

    # SETUP
    before :each do
      @category = Category.create! name: 'Apparel'
  
      10.times do |n|
        @category.products.create!(
          name:  Faker::Hipster.sentence(3),
          description: Faker::Hipster.paragraph(4),
          image: open_asset('apparel1.jpg'),
          quantity: 10,
          price: 64.99
        )
      end
    end

  scenario "They see a particular product" do
    # ACT
    visit root_path
    first('article a h4').click

    # DEBUG / VERIFY
    expect(page).to have_text 'Quantity'
    save_screenshot 'productDetails.png'

  end

end