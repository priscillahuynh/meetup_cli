class Event 
  attr_accessor :name, :date, :time, :description
  
  def initialize(name, date, time, description)
    @name = name 
    @date = date
    @time = time 
    @description = description
  end
end 