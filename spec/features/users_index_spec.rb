require 'rails_helper'

RSpec.describe 'users_index', type: :feature do
  before :each do
    @user1 = User.create(name: 'Hekapoo',
                         photo: 'https://unsplash.com/photos/Hekapoo', bio: 'Complete bio Hekapoo', posts_counter: 0)
    @user2 = User.create(name: 'Peloton',
                         photo: 'https://unsplash.com/photos/Peloton', bio: 'Complete bio Peloton', posts_counter: 1)
    @user3 = User.create(name: 'Tartaroude',
                         photo: 'https://unsplash.com/photos/Tart', bio: 'Complete bio Tartaroude',
                         posts_counter: 2)

    visit users_path
  end
  it 'I can see the username of all other users' do
    expect(page).to have_content('Hekapoo')
    expect(page).to have_content('Peloton')
    expect(page).to have_content('Tartaroude')
  end

  it 'I can see the profile picture for each user.' do
    expect(page).to have_selector('img')
  end

  it 'I can see the number of posts each user has written.' do
    expect(page).to have_content('Number of posts: 0')
    expect(page).to have_content('Number of posts: 1')
    expect(page).to have_content('Number of posts: 2')
  end

  it "When I click on a user, I am redirected to that user's show page." do
    click_link 'Hekapoo'
    expect(page).to have_content('Complete bio Hekapoo')
  end

  it 'When I click on Add post, I am redirected to posts new page' do
    first_link = page.all(:link, 'Add posts')[0] # Obtener el segundo link
    click_link(href: first_link['href'])
    expect(page) == "#{users_path}/#{@user1.id}/posts/new"
  end
end
