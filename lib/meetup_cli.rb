require 'nokogiri'
require 'open-uri'
require 'pry'
require_relative "meetup_cli/version"
require_relative "meetup_cli/cli"
require_relative "meetup_cli/scraper"
require_relative "meetup_cli/meetup"
require_relative "meetup_cli/event"

module MeetupCli
  class Error < StandardError; end
  # Your code goes here...
end
