require 'rails_helper'

RSpec.describe ApplicationsController, type: :controller do
  describe 'GET #index' do
    context 'filtering' do
      let(:activated_job) { Job.create!(title: 'Activated Job', created_at: 1.week.ago) }
      let(:deactivated_job) { Job.create!(title: 'Deactivated Job', created_at: 1.week.ago) }
      let!(:activated_application) { Application.create!(candidate_name: 'Activated Candidate', job: activated_job) }

      before do
        Application.create!(candidate_name: 'Deactivated Candidate', job: deactivated_job)
        Job::Event::Activated.create!(aggregate: activated_job, created_at: 1.week.ago)
        Job::Event::Deactivated.create!(aggregate: deactivated_job, created_at: 1.week.ago)
      end

      it 'returns a list of applications for all activated jobs' do
        get :index

        expect(response).to be_successful
        expect(parsed_json_response.length).to eq(1)
        expect(parsed_json_response).to eq([{
                                       job_name: activated_job.title,
                                       candidate_name: activated_application.candidate_name,
                                       status: "applied",
                                       number_of_notes: 0,
                                       last_interview_date: nil
                                     }])
      end
    end
  end
end
