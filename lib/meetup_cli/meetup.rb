class Meetup
  attr_accessor :name, :members
  
  def initialize(name, members)
    @name = name
    @members = members
  end
end