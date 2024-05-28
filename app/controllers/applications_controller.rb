# app/controllers/applications_controller.rb
class ApplicationsController < ApplicationController
  def index
    applications = Application.joins(job: :events).where('domain_events.type' => 'Job::Event::Activated')
    render json: applications, each_serializer: ApplicationSerializer
  end
end
