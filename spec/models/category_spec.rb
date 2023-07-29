# spec/models/category_spec.rb
require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:user) { User.create(name: 'Lucas Erkana', email: 'invalid_email', password: 'password') }

  it 'should not be valid with name value set to nil' do
    category = Category.new(name: nil, icon: 'food.jpng', author: user)
    expect(category).to_not be_valid
  end

  it 'should not be valid with icon value set to nil' do
    category = Category.new(name: 'Food', icon: nil, author: user)
    expect(category).to_not be_valid
  end

  it 'should be valid' do
    category = Category.new(name: 'Food', icon: 'food.jpng', author: user)
    expect(category).to be_valid
  end

  it 'should return 0 if there are no entities' do
    category = Category.create(name: 'Food', icon: 'food.jpng', author_id: user.id)
    expect(category.total_amount).to eq(0) 
  end

  it 'should return 0 if there are no entities using the class method' do
    expect(Category.total_amount(user)).to eq(0) 
  end

  it 'should return 0 if there are no entities' do
    category = Category.create(name: 'Food', icon: 'food.jpng', author_id: user.id)
    expect(category.total_amount).to eq(0) 
  end

  it 'should return 0 if there are no entities using the class method' do
    expect(Category.total_amount(user)).to eq(0)
  end
end
