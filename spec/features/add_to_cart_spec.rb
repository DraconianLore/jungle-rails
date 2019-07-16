require 'rails_helper'

RSpec.feature "Visitor adds an item to the cart", type: :feature, js: true do

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
      @user = User.create!(
        name: 'First User',
        email: 'first@user.com',
        password: '123456',
        password_confirmation: '123456'
      )
    end


  scenario "They add an item to the cart and see the cart items increase" do
    # ACT
visit '/login'

    within 'form' do
      fill_in id: 'email', with: 'first@user.com'
      fill_in id: 'password', with: '123456'

      click_button 'Submit'
    end
    
    first('article form button').click

    # DEBUG / VERIFY
    expect(page).to have_text 'My Cart (1)'
    save_screenshot

  end

end