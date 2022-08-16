class JobApplication < ApplicationRecord

  # To complete the association between (application and users) also between (job posts and applications).
  belongs_to :job_post
  belongs_to :user

  # To ensure that the status of the application would be either 'Not Seen' or 'Seen' if the recruiter view the job application.
  validates :status, acceptance: { accept: ['Not Seen', 'Seen'] }
end
