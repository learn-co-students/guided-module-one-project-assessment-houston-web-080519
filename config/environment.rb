require 'bundler'
Bundler.require
ActiveRecord::Base.logger = nil

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
require_all 'lib'

# PartsOfSpeech.create(order_id: "101" story_id: "1" part_of_speech: "Adjective")
# PartsOfSpeech.create(order_id: "102" story_id: "1" part_of_speech: "Adjective")
# PartsOfSpeech.create(order_id: "103" story_id: "1" part_of_speech: "Adjective")
# PartsOfSpeech.create(order_id: "104" story_id: "1" part_of_speech: "Frequency of Time")
# PartsOfSpeech.create(order_id: "105" story_id: "1" part_of_speech: "A game")
# PartsOfSpeech.create(order_id: "106" story_id: "1" part_of_speech: "Present Tense Verb")
# PartsOfSpeech.create(order_id: "107" story_id: "1" part_of_speech: "Noun")
# PartsOfSpeech.create(order_id: "108" story_id: "1" part_of_speech: "Noun")
# PartsOfSpeech.create(order_id: "109" story_id: "1" part_of_speech: "Noun")
# PartsOfSpeech.create(order_id: "110" story_id: "1" part_of_speech: "Noun")
# PartsOfSpeech.create(order_id: "111" story_id: "1" part_of_speech: "Verb +ing")

# return PartsOfSpeech.all

