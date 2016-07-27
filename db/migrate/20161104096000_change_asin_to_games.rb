class ChangeAsinToGames < ActiveRecord::Migration
  def change
    change_column :games, :asin, :text
  end
end                        
