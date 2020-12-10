class QuoteGarden::Apicalls
   
    include HTTParty 
      
    base_uri ='https://quote-garden.herokuapp.com/api/v2/'

   

      def self.random_quote
          attributes = HTTParty.get("https://quote-garden.herokuapp.com/api/v2/quotes/random").parsed_response
          QuoteGarden::Quote.new(attributes['quote'])
      end

      
      def self.search_by_author(input)
         authors = HTTParty.get("https://quote-garden.herokuapp.com/api/v2/authors/#{input}?page=1&limit=5").parsed_response
         QuoteGarden::Quote.new(authors['quotes'].sample)
      end
   
end

    
   # def self.genres
   #  response = HTTParty.get('https://quote-garden.herokuapp.com/api/v2/genres')
   #  genres = response.parsed_response
   #   genres["genres"].each_with_index do |elem, i|
   #      puts "#{i+1}. #{elem}".colorize(:green)
   #   end 
   # end  


#end
