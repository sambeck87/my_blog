require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.', posts_counter: 0) }

  before { subject.save }

  context 'name should be present' do
    it 'Users name should be Tom' do
      expect(subject.name).to eq('Tom')
    end

    it 'User should be valid' do
      expect(subject).to be_valid
    end

    it 'User should be invalid if name = nil' do
      subject.name = nil
      expect(subject).to_not be_valid
    end
  end

  context 'posts_counter should be  >= 0' do
    it 'subject should be valid' do
      expect(subject).to be_valid
    end

    it 'subject should be invalid if posts_counter = nil' do
      subject.posts_counter = nil
      expect(subject).to_not be_valid
    end

    it 'subject should be invalid if posts_counter is negative' do
      subject.posts_counter = -3
      expect(subject).to_not be_valid
    end
  end
end
