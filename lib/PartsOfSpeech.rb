class PartsOfSpeech < ActiveRecord::Base
    self.table_name = "partsofspeech"
    belongs_to(:madlib)
    has_one(:userinput)

end