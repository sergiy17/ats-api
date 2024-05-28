class Job < ApplicationRecord
  has_many :applications
  has_many :events, as: :aggregate, class_name: 'Job::Event'
  has_many :events, class_name: 'DomainEvent', as: :aggregate

  def status
    last_event = events.order(created_at: :desc).first
    return 'deactivated' unless last_event

    case last_event.type
    when 'Job::Event::Activated'
      'activated'
    when 'Job::Event::Deactivated'
      'deactivated'
    else
      'deactivated'
    end
  end
end
