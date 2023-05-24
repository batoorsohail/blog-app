require 'rails_helper'

RSpec.describe "Posts", type: :request do
  describe "GET /posts" do
    before do
      get user_posts_path(:user_id)
    end

    it "returns correct status" do
      expect(response).to have_http_status(:success)
    end

    it "renders the index template" do
      expect(response).to render_template(:index)
    end

    it "return the correct placeholder" do
      expect(response.body).to include("List of all posts")
    end
  end

  describe "Get specifc user's post" do
    user = User.create!(name: 'Ahmad', photo: 'www.image.com', bio: 'OG', posts_counter: 3)
    post = Post.create!(title: 'Spec Test', author_id: user.id, comments_counter: 5, likes_counter: 10)

    it "returns correct status" do
      get user_posts_path(user_id: user.id, id: post.id)
      expect(response).to have_http_status(:success)
    end

    it "renders the index template" do
      get "/users/#{user.id}/posts/#{post.id}"
      expect(response).to render_template(:show)
    end

    it "return the correct placeholder" do
      get "/users/#{user.id}/posts/#{post.id}"
      expect(response.body).to include("Here are the details of a specific post")
    end
  end
end
