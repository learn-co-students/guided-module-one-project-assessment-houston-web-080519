class MadLibMigration < ActiveRecord::Migration[5.2]
    def change
  
      create_table(:madlib) do | table |
        table.integer(:story_id)
        table.string(:story)
        table.string(:title)
      end
  
    end
  end