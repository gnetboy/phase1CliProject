class QuoteGarden::CLI

       include QuoteGarden::Memorable::Instance

    
    def run
        greeting
        pull_quote
        menu
    end
    
    def menu
      @prompt = TTY::Prompt.new
                show_options
                @input = nil
            while @input != 'e'
               @input = gets.strip.downcase
            if @input == 'r'
                show_options
                QuoteGarden::Quote.random_quote
                QuoteGarden::Quote.show_last_quote
            elsif @input == 'a'
                @input = @prompt.select("Choose an author: ", (QuoteGarden::Apicalls.authors),per_page: 25,filter: true)
                QuoteGarden::Apicalls.search_by_author("#{@input.downcase}")
                QuoteGarden::Quote.show_last_quote
                show_options
            elsif @input == 'g'           
               @choice = @prompt.select("Choose a genre: ", (QuoteGarden::Apicalls.genres),per_page: 25,filter: true)
                QuoteGarden::Apicalls.quote_by_genre("#{@choice.downcase}")
                QuoteGarden::Quote.show_last_quote
                show_options
            else @input == 'e'
                 goodbye
            end
            p QuoteGarden::Quote.all.count
        end

    end


    
end
    
        
        
     
    
 