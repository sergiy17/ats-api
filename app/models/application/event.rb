class Application::Event < DomainEvent
  self.table_name = 'domain_events'
end
