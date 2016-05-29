require 'rails_helper'

RSpec.describe Post, :type => :model do
  describe 'associations' do
    it {should have_many(:comments).dependent(:destroy)}
  end

  describe 'validations' do
    it {should validate_presence_of(:title)}
    it {should validate_presence_of(:body)}
  end
end
