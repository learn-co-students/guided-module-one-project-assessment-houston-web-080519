require_relative "../config/environment"
require "tty-prompt"
require 'pry'
require 'ruby-progressbar'
#require 'tty-cursor'
require_relative "./flight.rb"
require_relative "./train.rb"
require_relative "./fight_run.rb"
require_relative "./intro.rb"

$current_user = nil
$user = nil
$password = nil
$current_opponent = nil
$health = 100
$opponent_health = nil
$opponent_full_health = 100
$array_user_moves_choices = []
$opponent_move_choices = []
$flightcity = nil 
$frequentflyermiles = 0


intro
mainmenu

