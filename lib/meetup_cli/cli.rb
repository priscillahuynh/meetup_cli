class CLI 
  
  def start
    get_meetups
    input = "menu"
    while input != "exit" 
      puts "Welcome to Tech Meetups in Los Angeles!"
      puts "Please select a Meetup from the list below to view details:"
      @meetups.each.with_index(1) do |meetup, index|
        puts "#{index}. #{meetup.name} with #{meetup.members}"
      end
      
      input = gets.strip
      index = input.to_i - 1 
      selection = @meetups[index]
      
      puts "You have selected #{selection.name}."
      display_details(selection.url)
      puts "For information on future meetup events, type 'events'." 
      puts "To go back to the main menu, type 'menu'." 
      puts "To leave the program at any time, type 'exit'."
      input = gets.strip
    end
    
      case input
        when "events"
          Scraper.scrape_meetup_event(selection.url)
          puts "To go back to the main menu, type 'menu', or to exit the program type 'exit'."
          final_input = gets.strip
          if final_input == "menu"
            start
          elsif final_input == 'exit'
            puts "Come back again soon!"
          end
        when "menu"
          input = "menu"
        when "exit"
          puts "Come back again soon!"
        else
          puts "Invalid input. Please try again."
          input = "menu"
      end
  end 
  
  def display_details(url)
    Scraper.scrape_meetup_page(url)
  end
  
  def get_meetups
    Scraper.scrape_tech_meetups
    @meetups = Meetup.all.take(100)
  end
end 

