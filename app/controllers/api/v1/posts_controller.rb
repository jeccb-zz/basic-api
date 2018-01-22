module Api
  module V1
    class PostsController < ApplicationController
      def index
        posts = Post.all.order('created_at desc')
        render json: { data: posts }, status: :ok
      end

      def show
        post = Post.find(params[:id])
        render json: { data: post },status: :ok
      end

      def create
        post = Post.create(post_params)
        render json: { data: post },status: :ok
      end

      def destroy
        post = Post.find(params[:id]).destroy
        render json: { data: post },status: :ok
      end

      private

      def post_params
        params.permit(:title, :body)
      end
    end
  end
end
