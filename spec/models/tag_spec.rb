require 'rails_helper'

RSpec.describe Tag, :type => :model do
  describe 'associations' do
    it {should have_many(:taggings)}
  end
  describe 'validations' do
    it {should validate_uniqueness_of(:name)}
  end
end
