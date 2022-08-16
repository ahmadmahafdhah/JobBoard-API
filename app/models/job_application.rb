class JobApplication < ApplicationRecord
  belongs_to :job_post
  belongs_to :user
  validates :status, acceptance: { accept: ['Not Seen', 'Seen'] }
end
