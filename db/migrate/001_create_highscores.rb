class CreateHighscores < ActiveRecord::Migration[4.2]
    def change 
        create_table :high_scores do |t|
            t.string :username
            t.string :readout
            t.integer :score_difference
        end 
     end   
end 
