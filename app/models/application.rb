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
end
