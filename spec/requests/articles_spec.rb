require 'rails_helper'

RSpec.describe ArticlesController do
  describe "#index" do
    it "should return a success response" do
      get "/articles"
      # expect(response).to eq(200)
      expect(response).to have_http_status(:ok)
    end

    it "should return a proper JSON" do
      article = create(:article)
      get "/articles"
      body = JSON.parse(response.body).deep_symbolize_keys
      expect(body).to eq(
        data: [
          {
            id: article.id.to_s,
            type: "article",
            attributes: {
              title: article.title,
              content: article.content,
              slug: article.slug
            }
          }
        ]
      )
    end
  end
end