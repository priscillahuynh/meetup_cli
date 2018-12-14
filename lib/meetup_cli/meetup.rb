class Meetup
  attr_accessor :name, :members, :url, :info 
  @@all = []
  
  def initialize(name, members, url, info)
    @name = name
    @members = members
    @url = url
    @info = info
    @@all << self
  end
  
  def self.all
    @@all 
  end
end