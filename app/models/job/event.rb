class Job::Event < DomainEvent
  self.table_name = 'domain_events'
end

class Job::Event::Activated < Job::Event; end
class Job::Event::Deactivated < Job::Event; end
