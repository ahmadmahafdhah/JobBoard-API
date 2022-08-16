class JobApplicationsController < ApplicationController
	
	# To make sure users are authenticated before executing any action.
	before_action :authenticate_user!

	# To get the registered user info. 
	before_action :set_user

	# To prevent users from manipulating with other user's applications and to make sure that every user can only deal with his own applications
	before_action :require_user, except: [:index]

	# To ensure that only admin can view all users applications
	before_action :require_admin, only: [:index]

	# This function so I don't repeat my my code. 
	before_action :set_job_post, only: [:show, :new, :create, :destroy]

	def index
		@job_post = JobPost.find(params[:id])
		if @job_post.present?
			@job_applications = @job_post.job_applications
			if @job_applications.present?
				render json: @job_applications
			else
				render json: {message: "No applications for this job post"}
			end	
		else
			render json: {message: "No job post found"}
		end
	end

	def show
		@job_application = @job_post.job_applications.find_by(user_id: @user.id)
		if @job_application
			if current_user.admin?
				@job_application.status = "Seen"
				render json: @job_application
			else
				render json: @job_application
			end
		else
			render json: {message: "#{@user.email} has no applications for this job"}
		end
	end

	def new
		@job_application = JobApplication.new
	end

	def create
		@job_application = @job_post.job_applications.create(user_id: @user.id)
		if @job_application.save
			render json: @job_application
		else
			render json: @job_application.errors.full_messages
	end

	def destroy
		@job_application = @job_post.job_applications.find_by(user_id: @user.id)
		@job_application.destroy
		render json: {message: "Job application deleted susseccfully"}
	end

	private

	def set_job_post
		@job_post = JobPost.find(params[:id])
		if !@job_post.present?
			render json: {message: "No job found"}
		end
	end

	def set_user
		@user = current_user
	end

	def require_user
		if current_user != @job_application.user and !current_user.admin?
			render json: {message: "You can update or delete only your own job applications"}
		end
	end

	def require_admin
		if !current_user.admin?
			render json: {message: "Only admin can view all job applications"}
		end
	end

end
