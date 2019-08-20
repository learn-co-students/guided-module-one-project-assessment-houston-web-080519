require_relative '../config/environment.rb'
ActiveRecord::Base.logger = nil
prompt = TTY::Prompt.new

#puts "Hello! Welcome to MadLibs! Which story would you like to play?"
#user_choice = gets

#puts "hey you said #{user_choice}"

while true 
    users_response = prompt.select("Hello! Welcome to MadLibs! Which story would you like to play?",
        ["Coding",
        "Last Weekend"])
    
if users_response == "Coding"
    puts adj1.partofspeech
    users_response = gets.chomp
    UserInput.create({
        order_id: adj1.order_id
        input: users_response
    })
    #I want them to be prompted with the first part of speech, id 101, 
    #for story id 1. user inputs something which is pushed into the 
    #first blank of story 1. They are prompted with PoSpeech id 102, etc.
    #after the final PoSpeech prompt for story id 1, they are returned
    #the completed story 1 with their inputs interpolated into the 
    #blanks.
end

if users_response == "Last Weekend"
end
exit
end

#if user_input gets 