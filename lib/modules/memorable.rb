module  QuoteGarden::Memorable

   module Instance
      def greeting
         #system 'clear'
         @arter=Artii::Base.new
         puts @arter.asciify("Welcome to Quote Garden").colorize(:green)
         puts "Here is a random quote!:\n".colorize(:blue)
         QuoteGarden::Apicalls.genres
      end
       
      def pull_quote
         QuoteGarden::Quote.random_quote
         QuoteGarden::Quote.show_last_quote
      end

      def show_options
         puts "Please make a choice:\n ".colorize(:green)
         puts "To get a random quote press r".colorize(:blue)
         puts "To search by author press a".colorize(:blue)
         puts "To search by genre press g".colorize(:blue)
         puts "To exit press e".colorize(:blue)
      end
      
      def goodbye
         
         puts @arter.asciify('Goodbye').colorize(:green)
         puts "\n\nThank you for checking out my cli app!\n".colorize(:blue)
         system exit
      end
    end


end