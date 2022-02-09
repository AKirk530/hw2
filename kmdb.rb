# In this assignment, you'll be using the domain model from hw1 (found in the hw1-solution.sql file)
# to create the database structure for "KMDB" (the Kellogg Movie Database).
# The end product will be a report that prints the movies and the top-billed
# cast for each movie in the database.

# To run this file, run the following command at your terminal prompt:
# `rails runner kmdb.rb`

# Requirements/assumptions
#
# - There will only be three movies in the database – the three films
#   that make up Christopher Nolan's Batman trilogy
# - Movie data includes the movie title, year released, MPAA rating,
#   and director
# - A movie has a single director
# - A person can be the director of and/or play a role in a movie
# - Everything you need to do in this assignment is marked with TODO!

# Rubric
# 
# There are three deliverables for this assignment, all delivered within
# this repository and submitted via GitHub and Canvas:
# - Generate the models and migration files to match the domain model from hw1.
#   Execute the migration files to create the tables in the database. Add the
#   relevant association methods in each model. (5 points)
# - Insert the "Batman" sample data using ruby code. Do not use hard-coded ids and
#   delete any existing data beforehand so that each run of this script does not
#   create duplicate data. (5 points)
# - Query the data and loop through it to display output similar to the following
#   sample "report". (10 points)

# Submission
# 
# - "Use this template" to create a brand-new "hw2" repository in your
#   personal GitHub account, e.g. https://github.com/<USERNAME>/hw2
# - Do the assignment, committing and syncing often
# - When done, commit and sync a final time, before submitting the GitHub
#   URL for the finished "hw2" repository as the "Website URL" for the 
#   Homework 2 assignment in Canvas

# Successful sample output is as shown:

# Movies
# ======

# Batman Begins          2005           PG-13  Christopher Nolan
# The Dark Knight        2008           PG-13  Christopher Nolan
# The Dark Knight Rises  2012           PG-13  Christopher Nolan

# Top Cast
# ========

# Batman Begins          Christian Bale        Bruce Wayne
# Batman Begins          Michael Caine         Alfred
# Batman Begins          Liam Neeson           Ra's Al Ghul
# Batman Begins          Katie Holmes          Rachel Dawes
# Batman Begins          Gary Oldman           Commissioner Gordon
# The Dark Knight        Christian Bale        Bruce Wayne
# The Dark Knight        Heath Ledger          Joker
# The Dark Knight        Aaron Eckhart         Harvey Dent
# The Dark Knight        Michael Caine         Alfred
# The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
# The Dark Knight Rises  Christian Bale        Bruce Wayne
# The Dark Knight Rises  Gary Oldman           Commissioner Gordon
# The Dark Knight Rises  Tom Hardy             Bane
# The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
# The Dark Knight Rises  Anne Hathaway         Selina Kyle

# Delete existing data, so you'll start fresh each time this script is run.
# Use `Model.destroy_all` code.
# TODO!

# Generate models and tables, according to the domain model
# TODO!

# Insert data into your database that reflects the sample data shown above
# Do not use hard-coded foreign key IDs.
# TODO!

# Prints a header for the movies output
puts "Movies"
puts "======"
puts ""

# Query the movies data and loop through the results to display the movies output
# TODO!

# Prints a header for the cast output
puts ""
puts "Top Cast"
puts "========"
puts ""

# Query the cast data and loop through the results to display the cast output for each movie
# TODO!




# SOLUTION Alexander Kirk Hw#2

# Delete existing data, so you'll start fresh each time this script is run.
# Use `Model.destroy_all` code.

Person.destroy_all
Movie.destroy_all
Role.destroy_all

# Generate models and tables, according to the domain model
#rails generate model People
#rails generate model Movies
#rails generate model Role

#class CreateRoles < ActiveRecord::Migration[7.0]
#def change
    #create_table :roles do |t|
     # t.string :movie_id
     # t.string :person_id
     # t.string :character_name

     # t.timestamps
  #  end
 # end
#end

#class CreateMovies < ActiveRecord::Migration[7.0]
  #  def change
      #create_table :movies do |t|
      #  t.string :title
      #  t.string :year_released
      #  t.string :rated
      #  t.string :person_id
  
      #  t.timestamps
   #   end
  #  end
  #end
  
 # class CreatePeople < ActiveRecord::Migration[7.0]
  #  def change
  #    create_table :people do |t|
   #     t.string :name
  
   #     t.timestamps
  #    end
  #  end
  #end

# rails db:migrate

# Insert data into your database that reflects the sample data shown above
# Do not use hard-coded foreign key IDs.

## INSET PEOPLE

person = Person.new
person.name = "Christian Bale"
person.save

person = Person.new
person.name = "Michael Caine"
person.save

person = Person.new
person.name = "Liam Neeson"
person.save

person = Person.new
person.name = "Katie Holmes"
person.save

person = Person.new
person.name = "Gary Oldman"
person.save

person = Person.new
person.name = "Heath Ledger"
person.save

person = Person.new
person.name = "Aaron Eckhart"
person.save

person = Person.new
person.name = "Maggie Gyllenhaal"
person.save

person = Person.new
person.name = "Tom Hardy"
person.save

person = Person.new
person.name = "Joseph Gordon-Levitt"
person.save

person = Person.new
person.name = "Anne Hathaway"
person.save


## INSERT MOVIES
#puts Movie.all.count

movie = Movie.new
movie.title = "Batman Begins"
movie.year_released = "2005"
movie.rated = "PG-13"
movie.person_id = "Christopher Nolan"
movie.save

movie = Movie.new
movie.title = "The Dark Knight"
movie.year_released = "2008"
movie.rated = "PG-13"
movie.person_id = "Christopher Nolan"
movie.save

movie = Movie.new
movie.title = "The Dark Knight Rises"
movie.year_released = "2012"
movie.rated = "PG-13"
movie.person_id = "Christopher Nolan"
movie.save

## INSERT ROLE
#Batman Begins
role = Role.new
role.character_name = "Bruce Wayne"
role.movie_id = Movie.where({title:"Batman Begins"})
role.person_id = Person.where({name:"Christian Bale"})[0]
role.save

role = Role.new
role.character_name = "Alfred"
role.movie_id = Movie.where({title:"Batman Begins"})
role.person_id = Person.where({person_id:"Michael Caine"})[0]
role.save

role = Role.new
role.character_name = "Ra's Al Ghul"
role.movie_id = Movie.where({title:"Batman Begins"})
role.person_id = Person.where({person_id:"Liam Neeson"})[0]
role.save

role = Role.new
role.character_name = "Rachel Dawes"
role.movie_id = Movie.where({title:"Batman Begins"})
role.person_id = Person.where({person_id:"Katie Holmes"})[0]
role.save

role = Role.new
role.character_name = "Commissioner Gordon"
role.movie_id = Movie.where({title:"Batman Begins"})
role.person_id = Person.where({person_id:"Gary Oldman"})[0]
role.save

# The Dark Knight
role = Role.new
role.character_name = "Bruce Wayne"
role.movie_id = Movie.where({title:"The Dark Knight"})
role.person_id = Person.where({person_id:"Christian Bale"})[0]
role.save

role = Role.new
role.character_name = "Joker"
role.movie_id = Movie.where({title:"The Dark Knight"})
role.person_id = Person.where({person_id:"Heath Ledger"})[0]
role.save

role = Role.new
role.character_name = "Harvey Dent"
role.movie_id = Movie.where({title:"The Dark Knight"})
role.person_id = Person.where({person_id:"Aaron Eckhart"})[0]
role.save

role = Role.new
role.character_name = "Alfred"
role.movie_id = Movie.where({title:"The Dark Knight"})
role.person_id = Person.where({person_id:"Michael Caine"})[0]
role.save

role = Role.new
role.character_name = "Rachel Dawes"
role.movie_id = Movie.where({title:"The Dark Knight"})
role.person_id = Person.where({person_id:"Maggie Gyllenhaal"})[0]
role.save

# The Dark Knight Rises
role = Role.new
role.character_name = "Bruce Wayne"
role.movie_id = Movie.where({title:"The Dark Knight Rises"})
role.person_id = Person.where({person_id:"Christian Bale"})[0]
role.save

role = Role.new
role.character_name = "Commissioner Gordon"
role.movie_id = Movie.where({title:"The Dark Knight Rises"})
role.person_id = Person.where({person_id:"Gary Oldman"})[0]
role.save

role = Role.new
role.character_name = "Bane"
role.movie_id = Movie.where({title:"The Dark Knight Rises"})
role.person_id = Person.where({person_id:"Tom Hardy"})[0]
role.save

role = Role.new
role.character_name = "John Blake"
role.movie_id = Movie.where({title:"The Dark Knight Rises"})
role.person_id = Person.where({person_id:"Joseph Gordon-Levitt"})[0]
role.save

role = Role.new
role.character_name = "Selina Kyle"
role.movie_id = Movie.where({title:"The Dark Knight Rises"})
role.person_id = Person.where({person_id:"Anne Hathaway"})[0]
role.save

# Prints a header for the movies output
puts "Movies"
puts "======"
puts ""

# Query the movies data and loop through the results to display the movies output

#p "#{movie.title} #{movie.year_released} #{movie.rated} #{movie.person_id}"


# Prints a header for the cast output
puts ""
puts "Top Cast"
puts "========"
puts ""

# Query the cast data and loop through the results to display the cast output for each movie

#cast = roles.where({movie_id:"Batman Begins"})
##cast = roles.where({movie_id:"The Dark Knight"})
#cast = roles.where({movie_id:"The Dark Knight Rises"})
#puts roles.inspect