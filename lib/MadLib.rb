class MadLib < ActiveRecord::Base
    self.table_name = "madlib"
has_many(:partsofspeech)
has_many(:userinputs, {through: :partsofspeech})
end