class Application::Event::Hired < Application::Event
  def hired_date
    data['hired_date']
  end

  def hired_date=(value)
    self.data ||= {}
    self.data['hired_date'] = value
  end
end