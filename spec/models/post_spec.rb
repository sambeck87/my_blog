require 'rails_helper'

RSpec.describe Post, type: :model do
  author = User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.', posts_counter: 0)
  subject = Post.new(author: author, title: 'Hello', text: 'This is my first post', comments_counter: 0, likes_counter: 0)

  context 'title should be present' do
    it 'post title should be Hello' do
      author = double('author')
      expect(subject.title).to eq('Hello')
    end

    it 'post should be valid' do
      expect(subject).to be_valid
    end

    it 'post should be invalid if title = nil' do
      subject.title = nil
      expect(subject).to_not be_valid
    end
  end

  context 'comments_counter should be  >= 0' do
    it 'post should be valid' do
      subject.title = 'Hello'
      expect(subject).to be_valid
    end

    it 'post should be invalid if comments_counter = nil' do
      subject.comments_counter = nil
      expect(subject).to_not be_valid
    end

    it 'post should be invalid if comments_counter is negative' do
      subject.comments_counter = -3
      expect(subject).to_not be_valid
    end
  end

  context 'likes_counter should be  >= 0' do
    it 'post should be valid' do
      subject.comments_counter = 0
      expect(subject).to be_valid
    end

    it 'post should be invalid if likes_counter = nil' do
      subject.likes_counter = nil
      expect(subject).to_not be_valid
    end

    it 'post should be invalid if likes_counter is negative' do
      subject.likes_counter = -3
      expect(subject).to_not be_valid
    end
  end
end

