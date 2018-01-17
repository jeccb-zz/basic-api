module Api
  module V1
    class PostsController < ApplicationController
      def index
        posts = Post.all.order('created_at desc')
        render json: {status: 'success', data: posts}
      end

      def show
        post = Post.find(params[:id])
        render json: {status: 200, message: 'Loaded post', data: post}
      end

      def create
        post = Post.create(post_params)
        render json: render_message(post, :create)
      end

      def destroy
        post = Post.find(params[:id]).destroy
        render json: render_message(post, :destroy)
      end

      private

      def post_params
        params.permit(:title, :body)
      end

      def render_message(post, action)
        messages = {
          true: { status: 200, message: "Post is #{action}", data: post },
          false: { status: 401, message: "Post is not #{action}", data: post.errors.messages }
        }

        actions = {
          create:  post.persisted?.to_s.to_sym,
          destroy: post.destroyed?.to_s.to_sym
        }

        messages[actions[action]]
      end
    end
  end
end
