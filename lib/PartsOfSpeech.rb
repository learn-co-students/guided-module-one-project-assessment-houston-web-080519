class PartsOfSpeech < ActiveRecord::Base
    belongs_to(:madlib)
    has_one(:userinput)

end