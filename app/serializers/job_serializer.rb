# app/serializers/job_serializer.rb
class JobSerializer < ActiveModel::Serializer
  attributes :name, :status, :hired_candidates_count, :rejected_candidates_count, :ongoing_applications_count

  def name
    object.title
  end
end
