class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  def self.update_comments_counter(title)
    post = Post.find_by(title:)
    post.update(comments_counter: Comment.where(post_id: Post.find_by(title:).id).length)
  end
end
