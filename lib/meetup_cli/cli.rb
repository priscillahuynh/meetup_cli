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
    puts "You have selected #{selection}."
    display_details(selection.name)
    url = selection.url
    puts "For information on future meetup events, type 'events'. To go back to the main menu, type 'menu."
    input = gets.strip
      case input
        when "events"
          Scraper.scrape_meetup_event(url)
        when "menu"
      end
  end
  
  def display_details(selection)
    Scraper.scrape_meetup_page(selection.url)
  end
  
  # def scrape_meetup_event(url)
  #   Scraper.scrape_meetup_event(url)
  # end
  
end 

