require 'rails_helper'

RSpec.describe Comment, type: :model do
  comment = Comment.new(author_id: 1, post_id: 1)

  it 'Reutrns author id' do
    expect(comment.author_id).to eql 1
  end

  it 'Reutrns post id' do
    expect(comment.post_id).to eql 1
  end

  it 'checks comments_counter method' do
    User.new(name: 'Ahmad', photo: 'www.iamge.com', bio: 'Full Stack Developer', posts_counter: 5)
    post = Post.new(author_id: 1, title: 'New', text: 'First post', comments_counter: 3, likes_counter: 2)
    comment = Comment.new(author_id: 1, post:)

    post.comments_counter = 2
    post.save

    comment.update_post_comments_counter
    comment.update_post_comments_counter
    expect(post.comments_counter).to eq(4)
  end
end