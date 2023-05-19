require 'rails_helper'

RSpec.describe User, type: :model do
  post = Post.new(author_id: 1, title: 'Hello World', text: 'Full Stack Developer', comments_counter: 5,
                  likes_counter: 10)

  it 'checks author id' do
    expect(post.author_id).to eq(1)
  end

  it 'title should not be null' do
    expect(post.title).to eq('Hello World')
  end

  it 'text should be valid' do
    expect(post.text).to eq('Full Stack Developer')
  end

  it 'comment should be greater or equal to 0' do
    expect(post.comments_counter).to eq(5)
  end

  it 'has a valid number for likes counter' do
    expect(post.likes_counter).to eq(10)
  end

  it 'brings last five comments for the post' do
    user = User.create!(name: 'JS', photo: 'www.image.com', bio: 'Full Stack Dveloper', posts_counter: 5)

    post = user.posts.create!(title: 'first post', text: 'this is the first post', comments_counter: 5,
                              likes_counter: 12)

    comment1 = post.comments.create!(author_id: user.id, text: 'first comment')
    comment2 = post.comments.create!(author_id: user.id, text: 'second comment')
    comment3 = post.comments.create!(author_id: user.id, text: 'third comment')
    comment4 = post.comments.create!(author_id: user.id, text: 'fourth comment')
    comment5 = post.comments.create!(author_id: user.id, text: 'fifth comment')

    expect(post.recent_comments).to eq([comment5, comment4, comment3, comment2, comment1])
  end

  it 'checks update_author_posts_counter' do
    user = User.create!(name: 'Ahmad', posts_counter: 0)

    post = user.posts.create!(title: 'New Test', text: 'Who am I', comments_counter: 3, likes_counter: 2)

    post.update_author_posts_counter
    post.update_author_posts_counter
    post.update_author_posts_counter

    user.reload

    expect(user.posts_counter).to eq(4)
  end
end
