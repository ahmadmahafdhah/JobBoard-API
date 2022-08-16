Rails.application.routes.draw do
  devise_for :users
  resources :job_posts
  resources :job_applications, except: [:edit, :update]
end
