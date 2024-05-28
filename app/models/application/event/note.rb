class Application::Event::Note < Application::Event
  def content
    data['content']
  end

  def content=(value)
    self.data ||= {}
    self.data['content'] = value
  end
end
