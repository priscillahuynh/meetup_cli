class Meetup
  attr_accessor :name, :members
  @@all = []
  
  def initialize(name, members)
    @name = name
    @members = members
    @@all << self
  end
  
  def self.all
    @@all 
  end
end