class UserInput < ActiveRecord::Migration[5.2]
    def change
  
      create_table(:userinput) do | table |
        table.integer(:order_id)
        table.string(:input)
      end
  
    end
  end