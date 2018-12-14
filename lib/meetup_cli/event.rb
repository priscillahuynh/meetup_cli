class Event 
  attr_accessor :name, :date_and_time, :event_description
  
  def initialize(name, date_and_time, event_description)
    @name = name 
    @date_and_time = date_and_time
    @event_description = event_description
  end
end 