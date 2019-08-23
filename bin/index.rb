require_relative '../config/environment.rb'
ActiveRecord::Base.logger = nil
prompt = TTY::Prompt.new

quit_game = false

while !quit_game
    users_response = prompt.select("Hello! Welcome to MadLibs! Which story would you like to play?",
        ["Coding",
        "Last Weekend"])


        MadLib.all.each do | madlib |

            if users_response == madlib.title
                #Find the story id in the seeded stories that correlates to the selected story.
                mad_lib_array = madlib.story.split(" ")
                #Split that story to make an array of each word.
                partsarray = []
                index_counter = 0
                mad_lib_array.each_with_index do | word, index |
                    if word == "_" 
                        puts "Give me a(n) #{PartsOfSpeech.all.find_by(order_id: index_counter, story_id: madlib.story_id).part_of_speech}."
                        #Iterate over story array. If an item is an underscore, print out the correlating part
                        #of speech that would fit to form a good mad lib.
                        temp_word = gets.chomp
                        partsarray.push(temp_word)
                        #push the user response into the empty partsarray.
                        index_counter += 1
                    else 
                        partsarray.push(word)
                        #push all the other words from the story in, too.
                    end
                end

                puts partsarray.join(" ")
                #return the completed story as a string instead of an array.
                puts "hit enter to continue..."
                gets

                exit
            end
        end 
end

# I am realizing that while this works and accomplishes what I set out to accomplish,
# it does not make use of a many to many relationship. It uses a one to many, with story
# to part of speech. I started out with an idea I wanted to make, and the relationships 
# I created from that idea were kind of secondary to wanting to create a fun madlib game.
# If I were to go back and do things correctly, maybe I would do I database of teachers and
# students, with a joining class of grades, to create a gradebook cli app. 