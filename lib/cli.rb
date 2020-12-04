class QuoteGarden::CLI

       include QuoteGarden::Memorable::Instance
    
    def run
        #greeting
        QuoteGarden::Quote.random_quote
        #QuoteGarden::Quote.show_random_quote
        print "search quotes by author: "
        @input=nil 
        @input = gets.chomp.downcase
        QuoteGarden::Quote.search_by_author(@input)
        #p QuoteGarden::Quote.all.count
        QuoteGarden::Quote.show_all_quotes
        #QuoteGarden::Apicalls.genres  #to do call the genres method in the cli
    
        sleep(2)
        exit
    end
    
 
end