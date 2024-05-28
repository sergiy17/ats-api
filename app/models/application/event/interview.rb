class Application::Event::Interview < Application::Event
  def interview_date
    data['interview_date']
  end

  def interview_date=(value)
    self.data ||= {}
    self.data['interview_date'] = value
  end
end