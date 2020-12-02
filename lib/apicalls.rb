class QuoteGarden::Apicalls
   
    include HTTParty 
       BASE = 'https://quote-garden.herokuapp.com/api/v2/'

  def self.retrieve_response
    HTTParty.get('https://quote-garden.herokuapp.com/api/v2/quotes/random')
  end

  def self.search_by_author(input)
   author = HTTParty.get("https://quote-garden.herokuapp.com/api/v2/authors/#{input}?").parsed_response
   #author.parsed_response
       author['quotes'].each {|q| puts q['quoteText'] }.sample
         
        # binding.pry
  end

   # def self.random
   #  attributes = retrieve_response.parsed_response
   #  #binding.pry
   #  QuoteGarden::Quote.new(attributes['quote'])

   # end

    
   # def self.genres
   #  response = HTTParty.get('https://quote-garden.herokuapp.com/api/v2/genres')
   #  genres = response.parsed_response
   #   genres["genres"].each_with_index do |elem, i|
   #      puts "#{i+1}. #{elem}".colorize(:green)
   #   end 
   # end  


end
