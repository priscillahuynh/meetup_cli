class CLI 
  
  def start 
    get_meetups
    input = "menu"
    while input == "menu" 
      loop do 
      select_meetup_and_display_details
      puts "For information on future meetup events, type 'events'."
      puts "To go back to the main menu, type 'menu."
      puts "To exit the program, type 'exit'."
      input = gets.strip
      
      loop do 
        until input == "events" || input == "menu" || input == "exit"
        puts "Invalid input. Please try again."
        input = gets.strip
        end
        break
      end
      
      case input
        when "events"
          Scraper.scrape_meetup_event(@selection.url)
          puts "To go back to the main menu, type 'menu', or to exit the program type 'exit'."
          final_input = gets.strip
          
          loop do 
            until final_input == "menu" || final_input == "exit"
            puts "Invalid input. Please try again."
            final_input = gets.strip
            end
            break
          end
          
          case final_input
          when "menu"
            input = "menu"
          when "exit"
            puts "Come back again soon!"
              break
          end
          
        when "menu"
          input = "menu"
        when "exit"
          puts "Come back again soon!"
            break
        end
      end
    end
  end 
  
  def display_details(url)
    Scraper.scrape_meetup_page(url)
  end
  
  def get_meetups
    Scraper.scrape_tech_meetups
    @meetups = Meetup.all.take(100)
  end
  
  def select_meetup_and_display_details
    puts "Welcome to Tech Meetups in Los Angeles!"
    puts "Please select a Meetup from the list below to view details:"
    @meetups.each.with_index(1) do |meetup, index|
      puts "#{index}. #{meetup.name} with #{meetup.members}"
    end
    input = gets.strip
    index = input.to_i - 1 
    @selection = @meetups[index]
    puts "You have selected #{@selection.name}."
    display_details(@selection.url)
  end 
  
end 

