class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def self.update_likes_post_counter(title)
    post = Post.find_by(title:)
    post.update(likes_counter: Like.where(post_id: Post.find_by(title:).id).length)
  end
end
