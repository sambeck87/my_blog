require 'rails_helper'

describe 'user_show', type: :feature do
  before :each do
    @user = User.create(name: 'Tornado',
      photo: 'https://unsplash.com/photos/Tornado',
      bio: 'Complete bio Tornado',
      posts_counter: 0
    )

    @post = Post.create(
      title: 'post 1',
      text: 'my last recent post',
      comments_counter: 0,
      likes_counter: 0,
      author: @user
    )

    @user.posts << [Post.create(
        title: 'post 2',
        text: 'new post 2',
        comments_counter: 0,
        likes_counter: 0,
        author: @user
      ),
      Post.create(
        title: 'post 3',
        text: 'new post 3',
        comments_counter: 0,
        likes_counter: 0,
        author: @user
      ),
      Post.create(
        title: 'post 4',
        text: 'new post 4',
        comments_counter: 0,
        likes_counter: 0,
        author: @user
      ),
      Post.create(
        title: 'post 5',
        text: 'new post 5',
        comments_counter: 0,
        likes_counter: 0,
        author: @user
      )
    ]

    Comment.create(author: @user, post: @post, text: 'comment 1')
    Comment.create(author: @user, post: @post, text: 'comment 2')
    Comment.create(author: @user, post: @post, text: 'comment 3')
    Comment.create(author: @user, post: @post, text: 'comment 4')
    Comment.create(author: @user, post: @post, text: 'comment 5')
    Comment.create(author: @user, post: @post, text: 'comment 6')

    visit user_posts_path(@user)
    @post1_url = "#{users_path}/#{@user.id}/posts/#{@post.id}"
  end

  it 'I can see the first comments on a post.' do
    expect(page).to have_content('comment 6')
    expect(page).to have_content('comment 5')
    expect(page).to have_content('comment 4')
    expect(page).to have_content('comment 3')
    expect(page).to have_content('comment 2')
    expect(page).not_to have_content('comment 1')
  end

  it 'I can see the users profile picture.' do
    expect(page).to have_selector('img')
  end

  it 'I can see the users username.' do
    expect(page).to have_content('Tornado')
  end

  it 'I can see the number of posts the user has written.' do
    expect(page).to have_content('Number of posts: 9')
  end

  it 'I can see a posts title' do
    expect(page).to have_content('Post # 1')
  end

  it 'I can see some of the posts body.' do
    expect(page).to have_content('new post 4')
  end

  it 'I can see how many comments a post has.' do
    all("#comment-count") do |count|
        expect(count.text).to eq('Comments: 6')
    end
  end

  it 'I can see how many likes a post has.' do
    all("#comment-count") do |count|
        expect(count.text).to eq('Like: 0')
    end
  end

  it 'I can see a section for pagination if there are more posts than fit on the view.' do
    all("#comment-count") do |count|
        expect(count.text).to eq('Pagination')
    end
  end

  it 'when I click on Add posts button It should display the post form' do
    click_link 'Add posts'
    expect(page).to have_content('Create a new post')
  end

  it 'When I click on a post, it redirects me to that posts show page.' do
    visit user_path(@user)
    click_link 'Post # 1'
    expect(current_path) == @post1_url
  end
end
