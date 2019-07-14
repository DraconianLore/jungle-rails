require 'rails_helper'

describe User, :type => :model do
    subject {
        described_class.new(name: 'anything', email: 'any@email.here', password: 'securepassword')
    }

    it 'is vaild with valid attributes' do
        expect(subject).to be_valid
    end

    it 'is not valid without a name' do
        subject.name = nil
        expect(subject).to_not be_valid
    end

    it 'is not valid without an email' do
        subject.email = nil
        expect(subject).to_not be_valid
    end

    it 'is not valid without a password' do
        subject.password = nil
        expect(subject).to_not be_valid
    end


end
