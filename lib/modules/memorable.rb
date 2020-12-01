module  QuoteGarden::Memorable

   module Instance

     

      def greeting
         arter=Artii::Base.new
         puts arter.asciify('Welcome to Quote Garden').colorize(:green)
         puts "Here is a random quote!:\n".colorize(:blue)
       end
    end


end