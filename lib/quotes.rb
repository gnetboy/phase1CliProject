class QuoteGarden::Quote
    @@all = []
    def initialize(attributes) #dynamically setting getters and setters

        attributes.each do |key, value| 
          self.class.attr_accessor(key)
          self.send(("#{key}="), value)
        end
        self.class.all << self
    end

    def self.all
        @@all
    end

    def self.random_quote
        QuoteGarden::Apicalls.random_quote
    end
    
    def self.search_by_author(input)
        QuoteGarden::Apicalls.search_by_author(input)
    end
    
    
    def self.show_last_quote
        q=QuoteGarden::Quote.all[-1]
        puts "*"*(80)
        puts q.quoteText.colorize(:green).wrap_to_limit(80)
        puts q.quoteAuthor.colorize(:blue)
        if q.quoteGenre == nil
            puts "Uncategorized".colorize(:red)
        else
            puts q.quoteGenre.colorize(:blue)
        end
        puts "*"*(80)
    end
     
    def quoteGenre
        if self.quoteGenre == nil
            begin
                raise CustomError
            rescue CustomError => error
                puts error.message
            end
        else
            self.quoteGenre
        end
    end
    #adding a custom error for Quote.quoteGenre
    class CustomError < StandardError
        def message
            "Hello from custom error!"
        end

    end
    
    def self.show_all_quotes
        
        QuoteGarden::Quote.all.each {|q|
            puts "*"*(80)
            puts q.quoteText.colorize(:green).wrap_to_limit(80)
            puts q.quoteAuthor.colorize(:blue)
         if q.quoteGenre == nil
           puts "Uncategorized".colorize(:red)
         else
            puts q.quoteGenre.colorize(:blue)
         end
            puts "*"*(80)
        }
    end 

end