module Api
  module V1
    class PostsController < ApplicationController
      def index
        posts = Post.all.order('created_at desc')
        render json: serializer(posts), status: :ok
      end

      def show
        post = Post.find(params[:id])
        render json: serializer(post), status: :ok
      end

      def create
        post = Post.create(post_params)
        render json: serializer(post), status: :ok
      end

      def destroy
        post = Post.find(params[:id]).destroy
        render json: serializer(post), status: :ok
      end

      private
      def post_params
        params.permit(:title, :body)
      end

      def serializer(object)
        PostSerializer.new(object).serialized_json
      end
    end
  end
end
