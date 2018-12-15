class CLI 
  
  def start 
    input = "menu"
    while input == "menu" 
      puts "Welcome to Tech Meetups in Los Angeles!"
      puts "Please select a Meetup from the list below to view details:"
      Scraper.scrape_tech_meetups
      meetups = Meetup.all.take(100)
      meetups.each.with_index(1) do |meetup, index|
        puts "#{index}. #{meetup.name} with #{meetup.members}"
      end
      
      input = gets.strip
      index = input.to_i - 1 
      selection = meetups[index]
      
      puts "You have selected #{selection.name}."
      display_details(selection.url)
      puts "For information on future meetup events, type 'events'. To go back to the main menu, type 'menu."
      input = gets.strip
    end
      case input
        when "events"
          Scraper.scrape_meetup_event(selection.url)
          puts "To go back to the main menu, type 'menu', or to exit the program type 'exit'."
        when "menu"
          input = "menu"
        
      end
  end 
  
  def display_details(url)
    Scraper.scrape_meetup_page(url)
  end
  
end 

