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
end
