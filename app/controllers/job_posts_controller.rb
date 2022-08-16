class JobPostsController < ApplicationController

	# This function so I don't repeat my code.
	before_action :set_job_post, only: [:show, :edit, :update, :destroy]
	
	# To make sure users are authenticated before executing any action.
	before_action :authenticate_user!

	# To ensure the only admin can add, edit, delete job posts, and regular users can only list job posts.
	before_action :require_admin, except: [:index, :show]

	def index
		@job_posts = JobPost.all
		if @job_posts.present?
			render json: @job_posts
		else
			render json: {message: "No jobs posted yet"}
		end
	end

	def show
		if @job_post.present?
			render json: @job_post
		else
			render json: {message: "No job post found"}
		end
	end

	def new
		@job_post = JobPost.new
	end

	def edit
	end

	def create
		@job_post = JobPost.new(params.require(:job_posts).permit(:title, :description))
		if @job_post.save
			render json: @job_post
		else
			render json: @job_post.errors.full_messages
		end
	end

	def update
		if @job_post = JobPost.update(params.require(:job_posts).permit(:title, :description))
			render json: @job_post
		else
			render @job_post.errors.full_messages
		end
	end

	def destroy
		@job_post.destroy
		render json: {message: "Job post deleted susseccfully"}
	end

	private

	def require_admin
		if !current_user.admin?
			render json: {message: "Only admin can add, edit or delete job posts"}
		end
	end

	def set_job_post
		@job_post = JobPost.find(params[:id])
	end

end
