class Scraper 
  
  def self.scrape_meetups
    page = Nokogiri::HTML(open("https://www.meetup.com/find/tech/?allMeetups=false&radius=2&userFreeform=Los+Angeles%2C+California%2C+USA&mcId=c90001&change=yes&sort=distance&eventFilter=mysugg"))
    page.css('.groupCard--content.nametag-photo-name.groupCard--title').each_with_index do |m,index|
      name = m.search('h3.padding-none').text.strip
      members = m.search('p.small.ellipsize').text.strip
      meetup = Meetup.new(name,members)
    end
    # --------------------------
    # heading_array = page.css('h3.padding-none').text.gsub("\t", "").gsub("\n","").split("                        ")
    # heading_array.each do |meetup|
    # name = meetup
    # end
    # members_array = page.css('p.small.ellipsize').text.gsub("\t", "").split("\n").select {|n| n != """"}
    # members_array.each do |m|
    #   members = 
    # # -------------------------
  end
end