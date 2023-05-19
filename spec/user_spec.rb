require 'rails_helper'

RSpec.describe User, type: :model do
  user = User.new(name: 'Ahmad', photo: 'www.image.com', bio: 'Full Stack Developer', posts_counter: 5)
  
  it 'name should be Ahmad' do
    expect(user.name).to eq('Ahmad')
  end

  it 'image should have a link' do
    expect(user.photo).to eq('www.image.com')
  end

  it 'user should have a bio' do
    expect(user.bio).to eq('Full Stack Developer')
  end

  it 'posts counter should be 5' do
    expect(user.posts_counter).to eq(5)
  end

  it 'brings last three posts for the user' do
    user = User.new(name: 'Ahmad', posts_counter: 0)
    user.save!

    user.posts.create!(title: 'Post 1', text: 'First post', likes_counter: 5, comments_counter: 2)
    user.posts.create!(title: 'Post 2', text: 'Second post', likes_counter: 5, comments_counter: 2)
    post3 = user.posts.create!(title: 'Post 3', text: 'Third post', likes_counter: 5, comments_counter: 2)
    post4 = user.posts.create!(title: 'Post 4', text: 'Fourth post', likes_counter: 5, comments_counter: 2)
    post5 = user.posts.create!(title: 'Post 5', text: 'Fifth post', likes_counter: 5, comments_counter: 2)

    expect(user.recent_posts).to eq([post5, post4, post3])
  end
end