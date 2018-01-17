module Api
  module V1
    class PostsController < ApplicationController
      def index
        posts = Post.all.order('created_at desc')
        render json: {status: 'success', data: posts}
      end
    end
  end
end
