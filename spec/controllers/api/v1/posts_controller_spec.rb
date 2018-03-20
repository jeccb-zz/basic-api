require 'rails_helper'

RSpec.describe Api::V1::PostsController, type: :controller do
  describe "GET index" do
    it "should be return a status 200" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "should be return a correct value of Posts" do
      get :index

      posts = post_serializable(response.body)
      expect(posts['data'].count).to eq Post.all.count
    end
  end

  describe "GET show" do
    it "should be return a specific Post" do
      post_id = 15
      post = Post.find post_id

      get :show, params: { id: post_id }

      post = post_serializable(response.body)
      expect(post['data']['id']).to eq post_id.to_s
    end
  end

  describe "POST create" do
    it "should be save a Post" do
      data = { title: 'title of Post', body: 'This is a content of Post.' }

      post :create, { params: data }

      post = post_serializable(response.body)
      expect(post['data']['attributes']['title']).to eq data[:title]
    end
  end

  private

  def post_serializable(body)
    JSON.parse(body)
  end
end
