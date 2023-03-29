class User < ApplicationRecord
  has_many :posts
  has_many :comments
  has_many :likes

  def self.recent_posts(name)
    p Post.where(author_id: User.find_by(name:).id).order(created_at: :desc).limit(3)
  end
end
