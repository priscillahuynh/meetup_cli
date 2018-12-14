class Meetup
  attr_accessor :name, :members, :url
  @@all = []
  
  def initialize(name, members, url)
    @name = name
    @members = members
    @url = url
    @@all << self
  end
  
  def self.all
    @@all 
  end
end