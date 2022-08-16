class JobPost < ApplicationRecord

	# To associate the job post with multiple applications made by users.
	has_many :job_applications

	# This is to erase errors if the admin tries to add a job post with empty fields.
	validates :title, :description, presence: true
end
