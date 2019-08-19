class PartsOfSpeech < ActiveRecord::Migration[5.2]
    def change
  
      create_table(:partsofspeech) do | table |
        table.integer(:order_id)
        table.integer(:story_id)
        table.string(:parts_of_speech)
      end
  
    end
  end