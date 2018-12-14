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
  
  def self.scrape_meetup_event(url)
    page = Nokogiri::HTML(open(url))
    page.css('div.bounds.bounds--wide.groupHome-nextMeetup').each do |event|
      name = event.css('div.text--ellipsisTwoLines.text--heavy.text--display3').text.strip
      date_and_time = event.css('span.eventTimeDisplay-startDate').text.strip
      event_description = event.css('div.chunk.eventCard--MainContent--description.text--ellipsisFiveLines.text--small.padding--top').text.strip
    event = Event.new(name,date_and_time,event_description)
    end
  end
  
  def self.scrape_meetup_page(url)
  page.css('div.group-description--wrapper').each do |text|
      info = text.text.gsub("What we're about", "")
      puts info
    end
  end
end