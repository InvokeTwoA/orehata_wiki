class AddHardTypeToGames < ActiveRecord::Migration
  def change
    add_column :games, :hard_type, :string
  end
end                        
