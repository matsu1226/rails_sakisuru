require 'rails_helper'

RSpec.describe "Tags", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get "/tags/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /index" do
    it "returns http success" do
      get "/tags/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/tags/edit"
      expect(response).to have_http_status(:success)
    end
  end

end
