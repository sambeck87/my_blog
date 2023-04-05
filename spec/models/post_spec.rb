require 'rails_helper'

RSpec.describe Post, type: :model do
  subject do
    author = User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.',
                      posts_counter: 0)
    Post.new(author:, title: 'pacualito', text: 'This is my first post', comments_counter: 0, likes_counter: 0)
  end

  context 'title should be correct' do
    it 'post title should be pacualito' do
      expect(subject.title).to eq('pacualito')
    end

    it 'post should be valid' do
      expect(subject).to be_valid
    end

    it 'post should be invalid if title = nil' do
      subject.title = nil
      expect(subject).to_not be_valid
    end

    it 'post should be invalid if title length > 250 characters' do
      subject.title = '
      The Enthralling Adventure of the Fearless Explorer
      Who Traversed the Majestic Mountains, Brave Forests, and Turbulent
      Seas to Reach the Farthest Reaches of the Earth, Discovering
      Unimaginable Wonders and Meeting Fascinating Cultures Along
      the Way...................
      '
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

  context 'the method recent_comments should return the last 5 comments of a specific post' do
    it 'recent_comments should return 5 elemets' do
      user2 = User.create(name: 'Lilly', photo: 'https://unsplash.com/phos/F_-0BxGuVvo', bio: 'Teacher from Pol',
                          posts_counter: 0)
      user2.comments.create!(author: user2, post: subject)
      user2.comments.create!(author: user2, post: subject)
      user2.comments.create!(author: user2, post: subject)
      user2.comments.create!(author: user2, post: subject)
      user2.comments.create!(author: user2, post: subject)
      user2.comments.create!(author: user2, post: subject)

      expect(Post.recent_comments('pacualito').length).to eql 5
    end

    it 'the fist element should be most recent than the lastone' do
      user2 = User.create(name: 'Lilly', photo: 'https://unsplash.com/ptos/F_-0BxGuVvo', bio: 'Teacher from Pol',
                          posts_counter: 0)
      user2.comments.create!(author: user2, post: subject)
      user2.comments.create!(author: user2, post: subject)
      user2.comments.create!(author: user2, post: subject)
      user2.comments.create!(author: user2, post: subject)
      user2.comments.create!(author: user2, post: subject)
      user2.comments.create!(author: user2, post: subject)

      expect(Post.recent_comments('pacualito')[0].created_at).to be > Post.recent_comments('pacualito')[2].created_at
    end
  end
end
