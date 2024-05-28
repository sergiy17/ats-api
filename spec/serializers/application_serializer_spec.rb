require 'rails_helper'

RSpec.describe ApplicationSerializer, type: :serializer do
  let(:activated_job) { Job.create!(title: 'Activated Job', created_at: 1.week.ago) }
  let(:application) { Application.create!(candidate_name: 'Activated Candidate', job: activated_job) }
  let(:serializer) { described_class.new(application).serializable_hash }

  it 'renders expected attributes' do
    expect(serializer[:job_name]).to eq(application.job.title)
    expect(serializer[:candidate_name]).to eq(application.candidate_name)
    expect(serializer[:status]).to eq(application.status)
    expect(serializer[:number_of_notes]).to eq(0)
    expect(serializer[:last_interview_date]).to eq(application.last_interview_date)
  end
end