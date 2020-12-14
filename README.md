Welcome to my cli project for phase 1 
at Flatiron School.

I  am using the quoteGarden API from
https://github.com/pprathameshmore/QuoteGarden
to get random quotes
and to search quotes by author 
or if one wishes to do by genre.

Everytime an api call is made to retrieve a quote
a new object is generated with its properties such as:

quoteText
quoteAuthor
quoteGenre

for example if we choose to get a random quote a new object is created
the same applies if we get a quote by author or genre.

the search quote by author functionality is not perfect so 
might keep working on that in a future version of the app.

to use the app after you clone it to your machine 
first install dependencies by running the following
command in the terminal: 

bundle install 

and to  run the app type:

bin/run

if you are asked to give permission to the file to run try:

chmod 755 bin/run

thanks for checking out my app.
