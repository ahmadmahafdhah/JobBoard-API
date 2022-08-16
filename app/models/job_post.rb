class JobPost < ApplicationRecord
	has_many :job_applications
	validates :title, :description, presence: true
end
