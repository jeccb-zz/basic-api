require 'rails_helper'

RSpec.describe Post, type: :model do
  it "#should be persist a valid Post" do
    params = {'title': 'This is the title', 'body': 'The body builder'}

    post = Post.create(params)

    expect(post.persisted?).to eq(true)
    expect(params[:title]). to eq(post.title)
    expect(params[:body]). to eq(post.body)
  end

  it "#validate that post is invalid because title is required" do
    params = {'body': 'The body builder'}

    post = Post.create(params)

    expect(post.valid?).to eq(false)
  end
end
