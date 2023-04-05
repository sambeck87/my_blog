require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mex', posts_counter: 0) }

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

  context 'the method recent_posts should return the last 3 post of a specific user' do
    it 'recent_posts should return 3 elemets' do
      user2 = User.create(name: 'casimiro', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Pol',
                          posts_counter: 0)
      user2.posts.create(author: subject, title: 'Hello', text: 'This is my first post', comments_counter: 0,
                         likes_counter: 0)
      user2.posts.create(author: subject, title: 'Hello', text: 'This is my first post', comments_counter: 0,
                         likes_counter: 0)
      user2.posts.create(author: subject, title: 'Hello', text: 'This is my first post', comments_counter: 0,
                         likes_counter: 0)
      user2.posts.create(author: subject, title: 'Hello', text: 'This is my first post', comments_counter: 0,
                         likes_counter: 0)

      expect(User.recent_posts('casimiro').length).to eql 3
    end

    it 'the fist element should be most recent than the lastone' do
      user2 = User.create(name: 'casimiro', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Pol',
                          posts_counter: 0)
      user2.posts.create(author: subject, title: 'Hello', text: 'This is my first post', comments_counter: 0,
                         likes_counter: 0)
      user2.posts.create(author: subject, title: 'Hello', text: 'This is my first post', comments_counter: 0,
                         likes_counter: 0)
      user2.posts.create(author: subject, title: 'Hello', text: 'This is my first post', comments_counter: 0,
                         likes_counter: 0)
      expect(User.recent_posts('casimiro')[0].created_at).to be > User.recent_posts('casimiro')[2].created_at
    end
  end
end
