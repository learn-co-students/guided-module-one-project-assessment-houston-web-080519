class UserInput < ActiveRecord::Base
    self.table_name = "userinput"
belongs_to(:partsofspeech)
end