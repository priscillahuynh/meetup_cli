class Scraper 
  
  # def self.scrape_tech_meetups
  #   page = Nokogiri::HTML(open("https://www.meetup.com/find/tech/?allMeetups=false&radius=2&userFreeform=Los+Angeles%2C+California%2C+USA&mcId=c90001&change=yes&sort=distance&eventFilter=mysugg"))
  #   page.css('.groupCard--content.nametag-photo-name.groupCard--title').each_with_index do |m,index|
  #     name = m.search('h3.padding-none').text.strip
  #     members = m.search('p.small.ellipsize').text.strip
  #     meetup = Meetup.new(name, members)
  #   end
  # end
# ------------------------------
# def self.scrape_index_page(index_url)
#     index_page = Nokogiri::HTML(open(index_url))
#     students = []
#     index_page.css("div.roster-cards-container").each do |card|
#       card.css(".student-card a").each do |student|
#         student_profile_link = "#{student.attr('href')}"
#         student_location = student.css('.student-location').text
#         student_name = student.css('.student-name').text
#         students << {name: student_name, location: student_location, profile_url: student_profile_link}
#       end
#     end
#     students
#   end

#-------------------------------

  def self.scrape_meetup
    page = Nokogiri::HTML(open("https://www.meetup.com/find/?allMeetups=true&radius=2&userFreeform=Los+Angeles%2C+California%2C+USA&mcId=c90001&sort=distance&eventFilter=mysugg"))
    page.css('ul.j-groupCard-list.searchResults.tileGrid.tileGrid--3col.tileGrid_atMedium--2col.tileGrid_atSmall--1col').each do |m| 
      m.css('li.groupCard.tileGrid-tile').each do |meetup|
        name = meetup.css('h3.padding-none').text.strip
        members = meetup.css('p.small.ellipsize').text.strip
        url = "#{meetup.attr('href')}"
      binding.pry
      end
    end
        
      
  end
  
end