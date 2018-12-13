class Scraper 
  
  def self.scrape_meetups
    page = Nokogiri::HTML(open("https://www.meetup.com/find/tech/?allMeetups=false&radius=2&userFreeform=Los+Angeles%2C+California%2C+USA&mcId=c90001&change=yes&sort=distance&eventFilter=mysugg"))
    heading = page.css('h3.padding-none').text.gsub("\t", "")
    new_heading = heading.gsub("\n","")
    heading_array = new_heading.split("                        ")
    binding.pry
    # .gsub(/\s+/, "")
  end
end