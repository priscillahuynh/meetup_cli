class Scraper 

  def self.scrape_tech_meetups
    page = Nokogiri::HTML(open("https://www.meetup.com/find/tech/?allMeetups=false&radius=2&userFreeform=Los+Angeles%2C+California%2C+USA&mcId=c90001&sort=distance&eventFilter=mysugg"))
    page.css('ul.j-groupCard-list.searchResults.tileGrid.tileGrid--3col.tileGrid_atMedium--2col.tileGrid_atSmall--1col').each do |m| 
        m.css('li.groupCard.tileGrid-tile').each do |meetup|
         name = meetup.css('h3.padding-none').text.strip
         members = meetup.css('p.small.ellipsize').text.strip
         url = meetup.css('a').first["href"]
         meetup = Meetup.new(name,members,url)
        end
      end
  end
  
end