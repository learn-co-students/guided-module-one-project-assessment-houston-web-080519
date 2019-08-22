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
                if word == "_" 
                    puts "Give me a(n) #{PartsOfSpeech.all.find_by(order_id: index_counter, story_id: 1).part_of_speech}."
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
        end


    if users_response == "Last Weekend"
        return_story = []
        mad_lib_id = 2
        current_mad_lib = MadLib.all.find do |mad_lib|
            mad_lib.story_id == mad_lib_id
        end

        mad_lib_array = current_mad_lib.story.split(" ") 

        partsarray = []
        index_counter = 0
        mad_lib_array.each_with_index do | word, index |
            if word == "_" 
                puts "Give me a(n) #{PartsOfSpeech.all.find_by(order_id: index_counter, story_id: 2).part_of_speech}."
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
    end
end
