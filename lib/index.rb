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
end

if users_response == "Last Weekend"
end
exit
end

#if user_input gets 