require 'rails_helper'

RSpec.describe PostsController, type: :request do
  describe 'GET /show' do
    context 'posts should render correctly' do
      it 'renders a successful response' do
        get '/users/3/posts'
        expect(response).to be_successful
      end

      it 'renders the index template' do
        user = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                           bio: 'Teacher from Poland.', posts_counter: 0)
        get "/users/#{user.id}/posts"
        expect(response).to render_template(:index)
      end

      it 'renders the index template' do
        get '/users/5/posts'
        expect(response.body).to include('List of posts')
      end

      it 'renders the show template' do
        get '/users/5/posts/8'
        expect(response).to render_template(:show)
      end

      it 'renders the show template' do
        get '/users/1/posts/1'
        expect(response.body).to include("Post's information")
      end
    end
  end
end
