require_relative "../config/environment"
require "tty-prompt"
require 'pry'
require 'ruby-progressbar'

$current_user = nil
$user = nil
$password = nil

def intro
    prompt = TTY::Prompt.new
    prompt.say("Hello! Welcome to The Ultimate Fighter!")
    signuporsignin
end 

def signuporsignin
    prompt = TTY::Prompt.new
    input1 = prompt.select("Choose your destiny?", ["Sign Up", "Login"])
    if input1 == "Sign Up"
        makeusername
    else 
        loginusername
    end
end

def makeusername
    prompt = TTY::Prompt.new
    array_of_usernames_signup = []
    emoji1 = prompt.decorate("👻 ")
    User.all.select do |user|
        array_of_usernames_signup.push(user.username)
    end
    $current_user = prompt.ask("Make a username. It will be your name inside the game.")
    if array_of_usernames_signup.include?($current_user) == false
        makepassword
    else
        prompt.say("Sorry, that username is already taken. Please try another!")
    end
end

def makepassword
    prompt = TTY::Prompt.new
    sex_filter = LanguageFilter::Filter.new matchlist: :profanity, replacement: :stars
    hate_filter = LanguageFilter::Filter.new matchlist: :hate, replacement: :stars
    emoji1 = prompt.decorate("👻 ")
    $password = prompt.mask("Make a password", mask: emoji1)
    if sex_filter.match?($password) || hate_filter.match?($password)
        prompt.say("Please input another password.")
    else
        selectgender_trainer_create
    end
end

def selectgender_trainer_create
    prompt = TTY::Prompt.new
    gender = prompt.select("Choose your gender", ["Male", "Female"])
    prompt = TTY::Prompt.new
    trainer = prompt.select("Choose your trainer.", ["Doc Louis", "Mickey Goldmill", "Red", "Lance"])
    new_user = User.create({
        :username => $current_user,
        :trainer_name => trainer,
        :energy => 100,
        :money => 0,
        :flex => 1,
        :str => 1,
        :end => 1,
        :fights_won => 0,
        :weeks_trained => 0,
        :injured => false,
        :password => $password,
        :gender => gender,
        :level => 1
    })

        saveuser

end

def loginusername
    prompt = TTY::Prompt.new
    username = nil
    array_of_usernames_login = []
    username = prompt.ask("What is your username?")
    User.all.select do |user|
        array_of_usernames_login.push(user.username)
    end
    if array_of_usernames_login.include?(username) == false
        prompt.say("Sorry that username doesn't exist.")
        signuporsignin
    else 
        $current_user = username
        puts "Current user is #{$current_user}."
        loginpassword
    end
end  

def loginpassword
    prompt = TTY::Prompt.new
    checkpassword = nil
    emoji1 = prompt.decorate("👻 ")

    User.all.each do |user|
        user.username == $current_user
        checkpassword = user.password
    end

    $password = prompt.mask("Make a password", mask: emoji1)
    if $password == checkpassword
        saveuser
    else
        $current_user = nil
        prompt.say("Sorry, you've entered the wrong password")
        loginpassword
    end
end 

def saveuser
    User.all.each do |user|
        if user.username == $current_user
            $user = user 
        end
    end
    goodluck  
end

def goodluck
    prompt = TTY::Prompt.new
    prompt.say("You're all set! Good luck!")
    start_game = prompt.select("Are You Ready?", ["START GAME"])
    if start_game == "START GAME"
        progressbar = ProgressBar.create(:title => "Loading", :starting_at => 0, :total => 100, :progress_mark => '█')
        100.times { progressbar.increment; sleep(0.1) }
    end
end

def mainmenu 
    prompt = TTY::Prompt.new
    puts "Current user is #{$current_user}."
    input9 = prompt.select("What do you want to do?", ["Stats", "Fight", "Train", "Help"])
    if input9 == "Stats"
        stats
    elsif input9 == "Fight"
        gotofight
    elsif input9 == "Train"
        gotrain
    elsif input9 == "Help"
        help
    end
end

def stats
    prompt = TTY::Prompt.new
    prompt.say("MONEY: #{current_user.money}")
    prompt.say("ENERGY: #{current_user.energy}")
    prompt.say("STRENGTH: #{current_user.strength}")
    prompt.say("FLEXIBILITY: #{current_user.flexibility}")
    prompt.say("ENDURANCE: #{current_user.endurance}")
    prompt.say("TRAINER: #{current_user.trainer}")
    prompt.say("WEEKS TRAINED #{current_user.weekstrained}")
    prompt.say("FIGHTS WON #{current_user.fights_won}")
    prompt.say("INJURED #{current_user.injured}")
    prompt.say("GENDER #{current_user.gender}")
    input10 = prompt.select("Ready to go back?", ["Back"])
    if input10 == "Back"
        mainmenu
    end
end

def gotofight
    prompt = TTY::Prompt.new
    prompt.say("This is where you'll be fighting")
    input11 = prompt.select("Ready to go back?", ["Back"])
    if input11 == "Back"
     mainmenu
    end
end

def gotrain
    prompt = TTY::Prompt.new
    if $user.weeks_trained == 0 && $user.level == 1
        prompt.say("#{$user.trainer_name}: Hey there champ! Looks like you've got your first big fight coming up. I've made an easy workout routine you can follow to get you prepared for Chuck Cianwood.")
        sleep(4.0)
        array_of_level_1_workouts = []
        Workout.all.each do |workout|
            if workout.level == 1
                array_of_level_1_workouts.push(workout.str_workouts)
                array_of_level_1_workouts.push(workout.flex_workouts)
                array_of_level_1_workouts.push(workout.end_workouts)
            end
        end
        puts "#{$user.trainer_name}: Here are your workouts for the next three weeks #{array_of_level_1_workouts}"
        puts
        sleep(2.0)
        input12 = prompt.select("Ready to go back?", ["Back"])
    end
    if input12 == "Back"
        mainmenu
    end
end

def help
    prompt = TTY::Prompt.new
    choosehelp = prompt.select("CHOOSE AN OPTION:", ["How Does Schedule Work", "How Do Fights Work", "About The Creators", "Back"])
    if choosehelp == "How Does Schedule Work"
        schedule
    elsif choosehelp == "How Do Fights Work"
        fighthelp
    elsif choosehelp == "About The Creators"
        about
    elsif choosehelp == "Back"
        mainmenu
    end
end


def schedulehelp
    prompt = TTY::Prompt.new
    prompt.say("Schedule tells you what your daily schedule looks like. COMING SOON: you'll be able to change your schedule!")
    choosehelp = prompt.select("Ready to go back?", ["Back"])
    if choosehelp == "Back"
        help
    end
end

def fighthelp
    prompt = TTY::Prompt.new
    prompt.say("It’s a turned-based combat system like pokemon!")
    sleep(2.0)
    prompt.say("Your moves (and your opponents) do X damage.")
    sleep(2.0)
    prompt.say("If you run out of energy before your opponent, you lose and have to restart the game.")
    sleep(2.0)
    choosehelp = prompt.select("Ready to go back?", ["Back"])
    if choosehelp == "Back"
        help
    end
end

def about
    prompt = TTY::Prompt.new
    prompt.say("Created by Michael Evans and Barrette Banner")
    prompt.say("We are students at the Flatiron School of Houston.")
    prompt.say("We were inspired by games like Pokémon and Punchout and wanted to see if we could create our own twist in a CLI applicaiton.")
    prompt.say("When we're not at our desk, you can find us on the 10th floor enjoying the free beer and ping-pong.")
    choosehelp = prompt.select("Ready to go back?", ["Back"])
    if choosehelp == "Back"
        help
    end
end


intro
mainmenu


