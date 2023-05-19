require 'rails_helper'

RSpec.describe Like, type: :model do
  like = Like.new(author_id: 1, post_id: 1)

  it 'Reutrns author id' do
    expect(like.author_id).to eql 1
  end

  it 'Reutrns post id' do
    expect(like.post_id).to eql 1
  end

  it 'checks likes_counter method' do
    User.new(name: 'Ahmad', photo: 'www.iamge.com', bio: 'Full Stack Developer', posts_counter: 5)
    post = Post.new(author_id: 1, title: 'New', text: 'First post', comments_counter: 3, likes_counter: 2)
    like = Like.new(author_id: 1, post:)

    post.likes_counter = 2
    post.save

    like.update_post_likes_counter
    like.update_post_likes_counter
    expect(post.likes_counter).to eq(4)
  end
end
