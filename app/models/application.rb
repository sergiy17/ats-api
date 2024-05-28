class Application < ApplicationRecord
  belongs_to :job
  has_many :events, as: :aggregate, class_name: 'Application::Event'

  def status
    last_event = events.order(created_at: :desc).first
    return 'applied' unless last_event

    case last_event.type
    when 'Application::Event::Interview'
      'interview'
    when 'Application::Event::Hired'
      'hired'
    when 'Application::Event::Rejected'
      'rejected'
    else
      'applied'
    end
  end

  def notes
    events.where(type: 'Application::Event::Note')
  end

  def last_interview_date
    events.where(type: 'Application::Event::Interview').order(created_at: :desc).first&.created_at
  end
end
