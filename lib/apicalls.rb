class QuoteGarden::Apicalls
   
    include HTTParty 
       BASE = 'https://quote-garden.herokuapp.com/api/v2/'

  def self.retrieve_response
    HTTParty.get('https://quote-garden.herokuapp.com/api/v2/quotes/random')
  end

  def self.search_by_word
   author = HTTParty.get('https://quote-garden.herokuapp.com/api/v2/authors/Bertrand')
   author.parsed_response
   sleep(1)
     puts author['quotes'].first['quoteText']
  end

   def self.random
    attributes= retrieve_response.parsed_response
    QuoteGarden::Quote.new(attributes[''])
   end

    
   def self.genres
    response = HTTParty.get('https://quote-garden.herokuapp.com/api/v2/genres')
    genres = response.parsed_response
     genres["genres"].each_with_index do |elem, i|
        puts "#{i+1}. #{elem}".colorize(:green)
     end 
   end  


end
