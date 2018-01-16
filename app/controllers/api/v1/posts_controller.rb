module Api
  module V1
    class PostsController < ApplicationController
      def index
        posts = Post.all.order('created_at desc')
        render json: {status: 'success', data: posts}
      end

      def show
        #TODO
      end

      def create
        #TODO
      end

      def destroy
        #TODO
      end
    end
  end
end
