class Application::Event < DomainEvent
  self.table_name = 'domain_events'
end

class Application::Event::Interview < Application::Event; end
class Application::Event::Hired < Application::Event; end
class Application::Event::Note < Application::Event; end
class Application::Event::Rejected < Application::Event; end
