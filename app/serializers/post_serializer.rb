class PostSerializer
  include FastJsonapi::ObjectSerializer

  attributes :title, :body, :created_at
end
