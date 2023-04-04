require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /users' do
    context 'users should render correctly' do
      it 'renders a successful response' do
        get users_path
        expect(response).to be_successful
      end

      it 'renders the correct template' do
        get users_path
        expect(response).to render_template(:index)
      end

      it 'renders the correct template' do
        user = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                           bio: 'Teacher from Poland.', posts_counter: 0)
        get user_path(id: user.id)
        expect(response).to render_template(:show)
      end

      it 'renders the view with the correct placeholder text' do
        get users_path
        expect(response.body).to include('List of users')
      end

      it 'renders the view with the correct placeholder text' do
        user = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                           bio: 'Teacher from Poland.', posts_counter: 0)
        get user_path(id: user.id)
        expect(response.body).to include("User's information")
      end
    end
  end
end
