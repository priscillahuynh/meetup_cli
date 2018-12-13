class CLI 
  
  def start 
    puts "Welcome to Tech Meetups in Los Angeles!"
    puts "Please select a Meetup from the list below to view details:"
    Scraper.scrape_meetups
    #displays list of Meetup events for user to select from
    meetups = Meetup.all
    meetups.each.with_index(1) do |meetup, index|
      puts "#{index}. #{meetup.name} with #{meetup.members}"
    end
  end
end 