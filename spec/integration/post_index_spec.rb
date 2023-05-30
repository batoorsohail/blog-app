require 'rails_helper'

RSpec.describe 'Posts', type: :feature do
  before(:each) do
    @user = User.create(name: 'John', photo: 'www.example.com', bio: 'Life science', posts_counter: 0)
    @postone = Post.create(title: 'something', text: 'hello', author: @user, comments_counter: 0, likes_counter: 0)
    @posttwo = Post.create(title: 'cool', text: 'world', author: @user, comments_counter: 0, likes_counter: 0)
    @comment1 = Comment.create(text: 'hello world', author: @user, post: @postone)
    @comment2 = Comment.create(text: 'this is amazing', author: @user, post: @postone)
    @likeone = Like.new(author: @user, post: @postone)
    @liketwo = Like.new(author: @user, post: @posttwo)
  end
end