class PostsController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]
	def index
	@posts = Post.all.order('created_at DESC')	
	end
	def new
	end	
	def create
  	@post = Post.new(post_params)
 
  	@post.save
  	redirect_to @post
end
	def show
		@post = Post.find(params[:id])
	end	
	private

	def post_params
		params.require(:post).permit(:title, :body, :image)
	end

	def find_post
		@post = Post.find(params[:id])
	end
end
