require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  render_views

  describe 'GET /show' do
    context 'users should render correctly' do
      it 'renders a successful response' do
        get :index
        expect(response).to be_successful
      end

      it 'renders the correct template' do
        get :index
        expect(response).to render_template(:index)
      end

      it 'renders the correct template' do
        get :show, params: { id: 4 }
        expect(response).to render_template(:show)
      end

      it 'renders the view with the correct placeholder text' do
        get :index
        expect(response.body).to include('List of users')
      end

      it 'renders the view with the correct placeholder text' do
        get :show, params: { id: 4 }
        expect(response.body).to include("User's information")
      end
    end
  end
end
