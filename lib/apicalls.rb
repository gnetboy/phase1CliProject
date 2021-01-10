class QuoteGarden::Apicalls
   attr_reader :input,:choice
    include HTTParty 
      
    base_uri ='https://quote-garden.herokuapp.com/api/v3/'

   

      def self.random_quote
         sleep(2)
          attributes = HTTParty.get("https://quote-garden.herokuapp.com/api/v3/quotes/random").parsed_response
          QuoteGarden::Quote.new(attributes['data'][0])
          binding.pry
         end
         
         def self.authors
            sleep(2)
            authors = HTTParty.get('https://quote-garden.herokuapp.com/api/v3/authors').parsed_response
            authors["data"]
            
         end 
         
         
         def self.search_by_author(input)
            sleep(2)
            @prompt = TTY::Prompt.new
            authors = HTTParty.get("https://quote-garden.herokuapp.com/api/v3/quotes?author=#{input.split(' ')[-1]}&limit=1").parsed_response
            if authors['data'].empty?
               print "\nI did not understand that please choose another author: ".colorize(:blue)
               input = @prompt.select("Choose an author: ", (QuoteGarden::Apicalls.authors),per_page: 25,filter: true)
               QuoteGarden::Quote.search_by_author(input)
            else   
               QuoteGarden::Quote.new(authors['data'].first)
            end
         end
         
         def self.genres
            sleep(2)
            genres = HTTParty.get('https://quote-garden.herokuapp.com/api/v3/genres').parsed_response
            genres["data"].each do |elem|
               name = elem
               QuoteGarden::Genre.new(name)
            end
         end 
         
         def self.quote_by_genre(choice)
            sleep(2)
            genre = HTTParty.get("https://quote-garden.herokuapp.com/api/v3/quotes?genre=#{choice}&limit=1").parsed_response
            #binding.pry
          QuoteGarden::Quote.new(genre['data'].first)
      end  


end

    
   


