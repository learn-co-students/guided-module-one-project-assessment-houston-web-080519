class MadLib < ActiveRecord::Base
has_many(:partsofspeech)
has_many(:userinputs, {through: :partsofspeech})
end