# app/serializers/application_serializer.rb
class ApplicationSerializer < ActiveModel::Serializer
  attributes :job_name, :candidate_name, :status, :number_of_notes, :last_interview_date

  def job_name
    object.job.title
  end

  def candidate_name
    object.candidate_name
  end

  def number_of_notes
    object.events.where(type: 'Application::Event::Note').count
  end
end
