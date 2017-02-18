require 'rails_helper'

RSpec.describe Category, type: :model  do

  it 'validates presence of title' do
    expect(Category.new(body: 'Test')).to_not be_valid
  end

  it 'validates presence of body' do
    expect(Category.new(title: 'Test')).to_not be_valid
  end

end