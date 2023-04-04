require 'rails_helper'

RSpec.describe PostsController, type: :request do
  describe 'GET /show' do
    context 'posts should render correctly' do
      user = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                         bio: 'Teacher from Poland.', posts_counter: 0)
      post = Post.create(author: user, title: 'Hello', text: 'This is my first post', comments_counter: 0,
                         likes_counter: 0)
      it 'renders a successful response' do
        get "/users/#{user.id}/posts"
        expect(response).to be_successful
      end

      it 'renders the index template' do
        user = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                           bio: 'Teacher from Poland.', posts_counter: 0)
        post = Post.create(author: user, title: 'Hello', text: 'This is my first post', comments_counter: 0,
                           likes_counter: 0)
        get "/users/#{user.id}/posts"
        expect(response).to render_template(:index)
      end

      it 'renders the index template' do
        user = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                           bio: 'Teacher from Poland.', posts_counter: 0)
        post = Post.create(author: user, title: 'Hello', text: 'This is my first post', comments_counter: 0,
                           likes_counter: 0)
        get "/users/#{user.id}/posts"
        expect(response.body).to include('Lilly')
      end
    end

    context 'posts should contain the correct information' do
      it 'renders the show template' do
        user = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                           bio: 'Teacher from Poland.', posts_counter: 0)
        post = Post.create(author: user, title: 'Hello', text: 'This is my first post', comments_counter: 0,
                           likes_counter: 0)
        get "/users/#{user.id}/posts/#{post.id}"
        expect(response).to render_template(:show)
      end

      it 'renders the show template' do
        user = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                           bio: 'Teacher from Poland.', posts_counter: 0)
        post = Post.create(author: user, title: 'Hello', text: 'This is my first post', comments_counter: 0,
                           likes_counter: 0)
        get "/users/#{user.id}/posts/#{post.id}"
        expect(response.body).to include('This is my first post')
      end
    end
  end
end
