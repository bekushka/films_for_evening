require 'open-uri'
require 'nokogiri'

require_relative 'film'

module FilmsReader
  extend self
    
  IMDB250_URL = 'https://www.imdb.com/chart/top/?ref_=nv_mv_250/?is-redirected=1/'.freeze

  def from_imdb250
    html = open_request(IMDB250_URL)
    document = Nokogiri::HTML(html)

    document.css('td.titleColumn').map do |item|
      Film.new(
        title: item.css('a').text,
        director: item.at('a')['title'].split(' (dir.)')[0],
        year: item.css('span').text.delete('()')
      )
    end
  end
  
  private
  
  def open_request(uri)
    URI.open(uri)
  end
end
