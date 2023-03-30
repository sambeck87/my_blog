require 'rails_helper'

RSpec.describe Like, type: :model do
  subject do
    user1 = User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.',
                     posts_counter: 0)
    Post.create(title: 'Hello', text: 'Mi first post', likes_counter: 0, comments_counter: 0, author: user1)
  end

  context 'likes_counter should be 0' do
    it 'post title should be Hello' do
      expect(subject.likes_counter).to eq(0)
    end
  end

  context 'like should increment likes_counter by 1 each' do
    it 'lsikes_counter should be equal to 3' do
      user2 = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.',
                          posts_counter: 0)
      user2.likes.create(post: subject)
      user2.likes.create(post: subject)
      user2.likes.create(post: subject)
      expect(subject.likes_counter).to eql 3
    end
  end
end
