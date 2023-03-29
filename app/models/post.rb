class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :likes
  has_many :comments

  def self.update_posts_counter(name)
    user = User.find_by(name:)
    user.update(posts_counter: Post.where(author_id: User.find_by(name:).id).length)
  end

  def self.recent_comments(title)
    p Comment.where(post_id: Post.find_by(title:).id).order(created_at: :desc).limit(5)
  end
end
