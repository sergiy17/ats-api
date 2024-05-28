require 'rails_helper'

RSpec.describe JobsController, type: :controller do
  describe 'GET #index' do
    let(:activated_job) { Job.create!(title: 'Activated Job', created_at: 1.week.ago) }
    let(:deactivated_job) { Job.create!(title: 'Deactivated Job', created_at: 1.week.ago) }

    before do
      Job::Event::Activated.create!(aggregate: activated_job, created_at: 1.week.ago)
      Job::Event::Deactivated.create!(aggregate: deactivated_job, created_at: 1.week.ago)

      Application.create!(candidate_name: 'Candidate 1', job: activated_job) # hired
      Application.create!(candidate_name: 'Candidate 2', job: activated_job) # rejected
      Application.create!(candidate_name: 'Candidate 3', job: deactivated_job)

      Application::Event::Hired.create!(aggregate: activated_job.applications.first, created_at: 2.days.ago)
      Application::Event::Rejected.create!(aggregate: activated_job.applications.second, created_at: 2.days.ago)
    end

    it 'returns a list of all jobs with their statuses and application counts' do
      get :index

      expect(response).to be_successful
      jobs_response = parsed_json_response
      expect(jobs_response.length).to eq(2)

      activated_job_response = jobs_response.find { |job| job[:name] == activated_job.title }
      deactivated_job_response = jobs_response.find { |job| job[:name] == deactivated_job.title }

      expect(activated_job_response).to eq({
                                             name: activated_job.title,
                                             status: 'activated',
                                             hired_candidates_count: 1,
                                             rejected_candidates_count: 1,
                                             ongoing_applications_count: 0
                                           })

      expect(deactivated_job_response).to eq({
                                               name: deactivated_job.title,
                                               status: 'deactivated',
                                               hired_candidates_count: 0,
                                               rejected_candidates_count: 0,
                                               ongoing_applications_count: 1
                                             })
    end
  end
end
