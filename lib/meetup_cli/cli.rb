class CLI 
  
  def start 
    puts "Welcome to Tech Meetups in Los Angeles!"
    puts "Please select a Meetup from the list below to view details:"
    Scraper.scrape_meetup
#     #displays list of Meetup events for user to select from
#     meetups = Meetup.all
#     meetups.each.with_index(1) do |meetup, index|
#       puts "#{index}. #{meetup.name} with #{meetup.members}"
#     end
    
#     input = gets.strip
#     index = input.to_i - 1 
#     selection = meetups[index]
#     display_details(selection)
#   end
  
#     def display_details
      
#     end
    
#     def valid_input?
      
    end
end 

