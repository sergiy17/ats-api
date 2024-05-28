require 'rails_helper'

RSpec.describe JobSerializer, type: :serializer do
  let(:job) { Job.create!(title: 'Activated Job', created_at: 1.week.ago) }
  let(:serializer) { described_class.new(job).serializable_hash }

  it 'renders expected attributes' do
    expect(serializer[:name]).to eq(job.title)
    expect(serializer[:status]).to eq(job.status)
    expect(serializer[:hired_candidates_count]).to eq(job.hired_candidates_count)
    expect(serializer[:rejected_candidates_count]).to eq(job.rejected_candidates_count)
    expect(serializer[:ongoing_applications_count]).to eq(job.ongoing_applications_count)
  end
end
