class QuoteGarden::Quote

    @@all = []
    
    def initialize(attributes) #dynamically setting getters and setters
        attributes.each do |key, value| 
          self.class.attr_accessor(key)
          self.send(("#{key}="), value)
        end
        self.class.all << self
    end

    def self.random_quote
        QuoteGarden::Apicalls.random
        
    end
    def self.show_quotes
        q=QuoteGarden::Quote.all[0]
        puts "*"*(80)
        puts q.quoteText.colorize(:green).wrap_to_limit(80)
        puts q.quoteAuthor.colorize(:blue)
        puts q.quoteGenre.colorize(:blue)
        puts "*"*(80)
    end

    def self.all
       @@all
    end
end