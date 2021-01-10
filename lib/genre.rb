class QuoteGarden::Genre
    attr_accessor :name
    @@all = []
     
    def initialize(name)
         self.name =name

         self.class.all << self 
    end
    
    def self.all
        @@all    
    end

    def self.show_genres
         self.class.all.each_with_index do |elem, i|
         puts "#{i+1}. #{elem.name}".colorize(:green)
         end
    end

end