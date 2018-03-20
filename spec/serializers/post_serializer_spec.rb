require 'rails_helper'

RSpec.describe PostSerializer, type: :serializer do
  describe "PostSerializer new" do
    it "return a correct hash when PostSerializer is called" do
      object = Post.last

      json = PostSerializer.new(object).serialized_json
      serializable_hash = JSON.parse(json)

      expect(serializable_hash['data']['id']).to eq object.id.to_s
      expect(serializable_hash['data']['attributes']['body']).to eq object.body
    end
  end
end
