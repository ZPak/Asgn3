# Asgn3

#Dataset
I used a dataset of League of Legends champions obtained from champion.gg
There is a JSON file in the source code. While this isn't directly related
to biology, one can draw parallels to how the data can be sorted (species
or kingdom for role, certain gene sequences for stats). Plus League champs
are (for the most part) biological beings.

#Transformations
The majority of the data isn't really transformed, but the table has
averages of all champions as well as champions of a particular role. I
did add a column called KDA, which is (Kills + Assists)/Deaths.

#Flexibility
The program can run with any number of rows, however the checkboxes will
not be spaced correctly.

#Biological
There is not much biological significance since most of the program
revolves around statistics and fictional characters.

#Technical
Parsed JSON file, created graph with variable number of columns, used
controlP5 checkboxes and buttons to allow the user more control over
what datapoints they are viewing.

#Running
Run in processing, you will need the controlP5 library
