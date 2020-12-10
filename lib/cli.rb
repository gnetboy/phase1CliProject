class QuoteGarden::CLI

    #attr_reader :again
       include QuoteGarden::Memorable::Instance
    
    def run
        greeting
        menu
    end
    
    def menu
        #QuoteGarden::Apicalls.genres  #to do call the genres method in the cli
        @random = QuoteGarden::Quote.random_quote
        @list_quotes = QuoteGarden::Quote.show_all_quotes
        puts "\n"
        @input = nil 
        while @input != "e"
            @again = print "search quotes by author or type letter 'e' to quit the application: " 
            @input = gets.strip.downcase
            QuoteGarden::Quote.search_by_author(@input)
            @list_quotes = QuoteGarden::Quote.show_all_quotes
            if @input == "e" 
                system exit
            else 
                 @again
            end
                
                # if @input.to_i > 0 && @input.to_i < Museum.museum_list.length + 1
                
            p QuoteGarden::Quote.all.count
            
        end

    end
        
     
    
 
end