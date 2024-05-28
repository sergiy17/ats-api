class JobsController < ApplicationController
  def index
    jobs = Job.all.includes(:events)
    render json: jobs, each_serializer: JobSerializer
  end
end
