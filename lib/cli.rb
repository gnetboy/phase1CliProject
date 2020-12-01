class QuoteGarden::CLI

       include QuoteGarden::Memorable::Instance
    
    def run
        greeting
        # QuoteGarden::Quote.random_quote
        # QuoteGarden::Quote.show_quotes
        #QuoteGarden::Apicalls.genres  #to do call the genres method in the cli
        p "do you prefer to search quotes by keyword:"
        # @input=nil 
        # @input = gets.chomp.downcase
      puts  QuoteGarden::Apicalls.search_by_word
    #    puts QuoteGarden::Quote.all.count
    
        sleep(2)
        exit
    end
    
 
end