require_relative '../config/environment'
ActiveRecord::Base.logger = nil 
puts "hello world"
running_game = true
playing_game = false
user_score = [0]
bot_score = [0]
# puts `clear`
while(running_game == true)
    selectVar = ""
    puts "Welcome to Shooters Shoot. In this game, you are playing against a bot celebrity in a game of pickup basketball. The first to 5 points wins the game. You can either Shoot a long ball, or a Short ball or dribble to increase chances of making your next shot. "
    prompt = TTY::Prompt.new
    name = prompt.ask('What is your name?') 
    
    opponent = prompt.select("Who do you want to play against?", %w(Barack_Obama Steve_Carell Bruce_Jenner Will_Smith Kanye_West Dwayne_the_Rock_Johnson Jax))
        
        # puts "what do you want to do next"
    # selectVar = gets.chomp()
     mainMenu = TTY::Prompt.new
     mainMenu = prompt.select("What Would you like to do?", [ "PlayGame", "HighScore", "Quit"])
    if(mainMenu == "PlayGame")
        #play game
        playing_game = true 
        puts "Type 'heads' or 'tails' to see who gets the ball first!"
        users_guess = gets.chomp.to_s
    
        if rand.round == 0
            coin = "heads"
        else
            coin = "tails"
        end
    
        if coin.to_s == users_guess.to_s
            puts "And the flip is " + coin.upcase + "! You get the ball first!"
        else
            puts "And the flip is " + coin + ". " + opponent + " gets the ball first." +opponent+ " makes a layup!"
            bot_score.push bot_score.max + 1 
            bot_score.shift
            puts "The score is #{user_score[0]} to #{bot_score[0]}." 

        end
        while(playing_game == true)
            #stuff happens in here
            # puts "Rules about Game dribble mechanics and shot mechanics. aslo quit. type dribble shoot or quit. But first lets flip a coin for ball. type heads or tails"
            # users_guess = gets.chomp.to_s
        
            # if rand.round == 0
            #     coin = "heads"
            # else
            #     coin = "tails"
            # end
        
            # if coin.to_s == users_guess.to_s
            #     puts "And the flip is " + coin.upcase + "! You get the ball first!"
            # else
            #     puts "And the flip is " + coin + ". " + opponent + " gets the ball first"
            # end
            # puts "what do you want to do next"
            # choice = gets.chomp()
            choice = prompt.select("What do you want to do next", ["shoot", "dribble", "quit"])
            user_shot_randomizer = (1..10).to_a
            bot_shot_options = (1..10).to_a
            if choice == 'quit'
                playing_game = false
            
            elsif choice == 'shoot' 
                shoot1or2 = TTY::Prompt.new
                shoot1or2 = prompt.select("Take a Short Shot(1 point), or a Long Shot?(2 points)", [ "Short", "Long"])
                if user_score[0] >= 5
                    puts "you beat " + opponent + "!"
                    #=====================================
                    HighScore.create({
                        username: name, 
                        readout: "#{user_score[0]} - #{bot_score[0]}",
                        score_difference: user_score[0]-bot_score[0],
                    })

                    # binding.pry
                    #=====================================
                    exit
                    playing_game = false

                end 
                if bot_score[0] >= 5
                    puts + opponent + " beat you"  "!"
                    HighScore.create({
                        username: name, 
                        readout: "#{user_score[0]} - #{bot_score[0]}",
                        score_difference: user_score[0]-bot_score[0],
                    })
                    exit 
                    playing_game = false

                end 
                if (shoot1or2 == "Short")
                     my_shot_predictor = user_shot_randomizer.sample
                    opponent_shot_predictor = bot_shot_options.sample
                    if my_shot_predictor > opponent_shot_predictor 
                        puts name + " took a shot over " + opponent + ", and made it!"
                        user_score.push user_score.max + 1 
                        user_score.shift
                        # binding.pry
                        puts name + ": " + user_score[0].to_s + "   to " + opponent + ": " + bot_score[0].to_s
                        # if user_score == [3]
                        #     puts "you beat " + opponent + "!"
                        #     playing_game = false

                        # end 
                    elsif opponent_shot_predictor > my_shot_predictor
                        puts opponent + " blocked yo shot! He makes a layup, and its your ball."
                            bot_score.push bot_score.max + 1 
                            bot_score.shift
                        puts "The score is #{user_score[0]} to #{bot_score[0]}." 
                    elsif my_shot_predictor == opponent_shot_predictor
                        puts "you were fouled! you make 1 free throw!"
                                 user_score.push user_score.max + 2 
                                user_score.shift
                    end 
                    if user_score[0] >= 5
                    puts "you beat " + opponent + "!"
                        HighScore.create({
                        username: name, 
                        readout: "#{user_score[0]} - #{bot_score[0]}",
                        score_difference: user_score[0]-bot_score[0],
                         })
                         exit
                        playing_game = false
                    end 
                    if bot_score[0] >= 5
                        puts  opponent + " beat you"  "!"
                        HighScore.create({
                        username: name, 
                        readout: "#{user_score[0]} - #{bot_score[0]}",
                        score_difference: user_score[0]-bot_score[0],
                         })
                         exit
                        playing_game = false

                    end 
                end 
                if(shoot1or2 == "Long")
                         my_shot_predictor = user_shot_randomizer.sample
                            opponent_shot_predictor = bot_shot_options.sample
                            if my_shot_predictor > opponent_shot_predictor 
                                puts name + " took a shot over " + opponent + ", and made it!"
                                user_score.push user_score.max + 2 
                                user_score.shift
                                puts name + ": " + user_score[0].to_s + "to " + opponent + ":" + bot_score[0].to_s
                            elsif opponent_shot_predictor > my_shot_predictor
                                puts opponent + " blocked yo shot, steps back and wets a long one!"
                                bot_score.push bot_score.max + 2 
                                bot_score.shift
                            puts "The score is #{user_score[0]}  to #{bot_score[0]}." 
            
                            elsif my_shot_predictor == opponent_shot_predictor
                                puts "you were fouled! you make 2 free throws"
                                user_score.push user_score.max + 2 
                                user_score.shift
                            end 
                            if user_score[0] >= 5
                                puts "you beat " + opponent + "!"
                                HighScore.create({
                                username: name, 
                                readout: "#{user_score[0]} - #{bot_score[0]}",
                                score_difference: user_score[0]-bot_score[0],
                                    })
                                    exit 
                            end 
                            if bot_score[0] >= 5
                                puts + opponent +" beat you"  "!"
                                HighScore.create({
                                username: name, 
                                readout: "#{user_score[0]} - #{bot_score[0]}",
                                score_difference: user_score[0]-bot_score[0],
                                 })
                                 exit 
                                playing_game = false
        
                            end 
                        
                    
    
                end 

                
            
   
            elsif choice == 'dribble'
                user_dribble_predictor = rand(1..10)
                opponent_dribble_predictor = rand(1..10)
                if user_dribble_predictor > opponent_dribble_predictor
                     puts "you break " + opponent + "'s ankles!!! you're more likely to make your next shot."
                        user_shot_randomizer.push user_shot_randomizer.max + 1
                elsif opponent_dribble_predictor > user_dribble_predictor
                        puts opponent + " Ripped " + name + "'s ball! its his possesion now! your chances of making another shot lower just a tad. " + opponent + " makes a layup."
                        user_shot_randomizer.delete(user_shot_randomizer.max)
                        bot_score.push bot_score.max + 1 
                        bot_score.shift

                end 
                if user_score[0] >= 5
                    puts "you beat " + opponent + "!"
                    HighScore.create({
                    username: name, 
                    readout: "#{user_score[0]} - #{bot_score[0]}",
                    score_difference: user_score[0]-bot_score[0],
                        })
                end 
                if bot_score[0] >= 5
                    puts  opponent +" beat you"  "!"
                    HighScore.create({
                    username: name, 
                    readout: "#{user_score[0]} - #{bot_score[0]}",
                    score_difference: user_score[0]-bot_score[0],
                     })
                    playing_game = false

                end 
                
                
            else 
                # puts "that entry is NONvalid!! the score is #{user_score[0]} to #{bot_score[0]}."  
             
            end 
            puts "The score is #{user_score[0]} to #{bot_score[0]}." 
        
        end#while playing_game is true
        # def win 
        #     puts "heyyy you won"
        # end 
        def lose 
            puts "youre a loser and always will be"
        end 

    elsif(mainMenu == "HighScore")
        hs_array = []
        #view highscores

        # p HighScore.all.sort_by { |hs| hs.score_difference }.reverse
        HighScore.all.each do  |top|
            if top.username == name # { |hs| hs.score_difference }.reverse
                hs_array << top.score_difference  
            end
            
        end
        p hs_array.reverse

    elsif(mainMenu == "Quit")
        #quit
        running_game = false
    else
        puts "that entry is nonvalid!"
    end
    


end#while running_game is true
