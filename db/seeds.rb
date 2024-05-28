two_days_ago = Time.now - 2.days

# engineer, hired
engineer_job = Job.create!(title: 'Software Engineer', created_at: 1.week.ago)
Job::Event::Activated.create!(aggregate: engineer_job, created_at: 1.week.ago)
engineer_application = Application.create!(candidate_name: 'John Galt', job: engineer_job)
Application::Event::Interview.create!(aggregate: engineer_application, created_at: 3.days.ago, interview_date: Time.new(two_days_ago.year, two_days_ago.month, two_days_ago.day, 14, 0, 0))
Application::Event::Note.create!(aggregate: engineer_application, content: 'Great candidate!', created_at: 3.days.ago)
Application::Event::Hired.create!(aggregate: engineer_application, created_at: 2.days.ago, hired_date: Time.new(two_days_ago.year, two_days_ago.month, two_days_ago.day, 15, 30, 0))
Job::Event::Deactivated.create!(aggregate: engineer_job, created_at: 1.week.ago) # candidate found, job deactivated

# hr, rejected
hr_job = Job.create!(title: 'HR')
Job::Event::Activated.create!(aggregate: hr_job, created_at: 1.week.ago)
hr_application = Application.create!(candidate_name: 'James Taggart', job: hr_job)
Application::Event::Interview.create!(aggregate: hr_application, created_at: 3.days.ago, interview_date: Time.new(two_days_ago.year, two_days_ago.month, two_days_ago.day, 16, 0, 0))
Application::Event::Note.create!(aggregate: hr_application, content: 'Not experienced enough', created_at: 3.days.ago)
Application::Event::Rejected.create!(aggregate: hr_application, created_at: 3.days.ago)

# pm, applied
pm_job = Job.create!(title: 'Product manager')
Job::Event::Activated.create!(aggregate: pm_job, created_at: 1.week.ago)
Application.create!(candidate_name: 'Dagny Taggart', job: pm_job) # status applied

# qa, interview
qa_job = Job.create!(title: 'QA') # status deactivated
Job::Event::Activated.create!(aggregate: qa_job, created_at: 1.week.ago)
qa_application = Application.create!(candidate_name: 'Henry Rearden', job: qa_job)
Application::Event::Interview.create!(aggregate: qa_application, created_at: 3.days.ago, interview_date: Time.new(two_days_ago.year, two_days_ago.month, two_days_ago.day, 11, 0, 0))

# devops
Job.create!(title: 'DevOps')


