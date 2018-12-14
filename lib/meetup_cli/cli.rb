class CLI 
  
  def start 
    puts "Welcome to Tech Meetups in Los Angeles!"
    puts "Please select a Meetup from the list below to view details:"
    Scraper.scrape_tech_meetups
    meetups = Meetup.all
    meetups.each.with_index(1) do |meetup, index|
      puts "#{index}. #{meetup.name} with #{meetup.members}"
    end
    
    input = gets.strip
    index = input.to_i - 1 
    selection = meetups[index]
    display_details(selection)
    
  end
  
  def display_details(selection)
    Scraper.scrape_meetup(selection.url)
  end
  
  def valid_input?
    
  end
end 

