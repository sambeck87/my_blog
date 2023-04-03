require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  render_views

  describe 'GET /show' do
    context 'posts should render correctly' do
      it 'renders a successful response' do
        get :index, params: { user_id: 3 }
        expect(response).to be_successful
      end

      it 'renders the index template' do
        user = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.',
                           posts_counter: 0)
        get :index, params: { user_id: user.id }
        expect(response).to render_template(:index)
      end

      it 'renders the index template' do
        get :index, params: { user_id: 5 }
        expect(response.body).to include('List of posts')
      end

      it 'renders the show template' do
        get :show, params: { user_id: 5, id: 8 }
        expect(response).to render_template(:show)
      end

      it 'renders the show template' do
        get :show, params: { user_id: 1, id: 1 }
        expect(response.body).to include("Post's information")
      end
    end
  end
end
