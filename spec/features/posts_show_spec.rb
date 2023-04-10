require 'rails_helper'

RSpec.describe 'post_show', type: :feature do
  before :each do
    @user = User.create(name: 'Hekapoo',
                        photo: 'https://unsplash.com/photos/Hekapoo', bio: 'Complete bio Hekapoo', posts_counter: 0)
    @post1 = Post.create(title: 'post 1', text: 'new post 1', comments_counter: 0, likes_counter: 4, author: @user)
    Comment.create(author: @user, post: @post1, text: 'my comments')
    visit "#{users_path}/#{@user.id}/posts/#{@post1.id}"
    @post1_url = "#{users_path}/#{@user.id}/posts/#{@post1.id}"
    @all_post_url = "#{users_path}/#{@user.id}/posts/"
  end

  it 'I can see the posts title' do
    expect(page).to have_content('Title: post 1')
  end

  it 'I can see who wrote the post' do
    expect(page).to have_content('by Hekapoo')
  end

  it 'I can see how many comments it has.' do
    expect(page).to have_content('Comments: 1')
  end

  it 'I can see how many likes it has' do
    expect(page).to have_content('Likes: 4')
  end

  it 'I can see the post body.' do
    expect(page).to have_content('new post 1')
  end

  it 'I can see the username of each commentor.' do
    expect(page).to have_content('Hekapoo: ')
  end

  it 'I can see the comment each commentor left.' do
    expect(page).to have_content('Hekapoo: my comments')
  end
end
