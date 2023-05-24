require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /users" do
    before do
      get users_path
    end

    it "returns correct status" do
      expect(response).to have_http_status(:success)
    end

    it "renders the index template" do
      expect(response).to render_template(:index)
    end

    it "return the correct placeholder" do
      expect(response.body).to include("List of all users")
    end
  end
end
