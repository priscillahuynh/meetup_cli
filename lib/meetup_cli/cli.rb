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
    puts "For information on future meetup events, type 'event'. To go back to the main menu, type 'menu."
    input = gets.strip
    
    # if input == "event"
    #   future_meetup_events
    # elsif input == "menu"
    #   start 
    # else 
    #   puts "Invalid input. Please try again"
    # end
  end
  
  def display_details(selection)
    Scraper.scrape_meetup(selection.url)
  end
  
  # def scrape_meetup
    
  # end
  
end 

