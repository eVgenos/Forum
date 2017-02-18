require 'rails_helper'

RSpec.describe User, type: :model  do

  it 'validates presence of password' do
    expect(User.new(email: 'test@test.ru', name: 'Test')).to_not be_valid
  end

  it 'validates presence of email' do
    expect(User.new(name: 'Test', password: '123456')).to_not be_valid
  end

end