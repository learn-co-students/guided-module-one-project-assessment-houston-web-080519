require_relative '../config/environment.rb'
ActiveRecord::Base.logger = nil
prompt = TTY::Prompt.new

quit_game = false

while !quit_game
    users_response = prompt.select("Hello! Welcome to MadLibs! Which story would you like to play?",
        ["Coding",
        "Last Weekend"])

        if users_response == "Coding"
            return_story = []
            mad_lib_id = 1
            current_mad_lib = MadLib.all.find do |mad_lib|
                mad_lib.story_id == mad_lib_id
            end

            mad_lib_array = current_mad_lib.story.split(" ")

            partsarray = []
            index_counter = 0
            mad_lib_array.each_with_index do | word, index |
            #part_of_speech = nil # ?
            # if we hit a special character we prompt the user
                
                if word == "_" 
                    puts "Give me a #{PartsOfSpeech.all.find_by(order_id: index_counter).part_of_speech}."
                    temp_word = gets.chomp
                    partsarray.push(temp_word)
                    index_counter += 1
                else 
                    partsarray.push(word)
                end
            end

            puts partsarray.join(" ")
            puts "hit enter to continue..."
            gets

            exit
        end#if response is codeing
    # if users_response == "Coding"
    #     while true do
    #     counter = 101
    #     storyarray = []
    #     compstoryarray = []
    #     puts PartsOfSpeech.partofspeech WHEN order_id = counter
    #     users_response1 = gets.chomp
    #     users_response1 << storyarray
    #     UserInput.create({
    #         order_id: adj1.order_id,
    #         input: users_response1
    #     })
        

    #     counter += 1 
    #     end#while
        # for running next part of speech? make a loop,
        #push each response into story array until it hits part of speech
        #id 111.

        # runs through each part of speech in order beginning with part of 
        # speech 101, ending with 111. push each response into storyarray.
        # after 111, puts out story 1 with user inputs.



        #I want them to be prompted with the first part of speech, id 101, 
        #for story id 1. user inputs something which is pushed into the 
        #first blank of story 1. They are prompted with PoSpeech id 102, etc.
        #after the final PoSpeech prompt for story id 1, they are returned
        #the completed story 1 with their inputs interpolated into the 
        #blanks.
    #coding


    # if users_response == "Last Weekend"
    # end
    if users_response == "Last Weekend"
        return_story = []
        mad_lib_id = 2
        # get the story strinhg
        current_mad_lib = MadLib.all.find do |mad_lib|
            mad_lib.story_id == mad_lib_id
        end

        
        # split the story string into an array
        mad_lib_array = current_mad_lib.story.split(" ")
        # iterate through the story array 
        mad_lib_array.each do |word|
        # if we hit a special character we prompt the user
            if word == "_"
                #function prompt
                    puts "Give me a word."
                    temp_word = gets.chomp
                
                    word = temp_word
            end
            #puts "we are shoveling in #{word}"
            return_story << word
        # if we hit the end of the array, we read the madlib
        end
        
        puts return_story.join(" ")
        puts "hit enter to continue..."
        gets

        exit

    end#Last Weekend

    # def replace
    #     puts "Give me a word."
    #     gets.chomp
    #     #prompt the user
    #     #return the user input
    # end



end
