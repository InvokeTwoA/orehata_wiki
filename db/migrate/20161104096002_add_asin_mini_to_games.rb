class AddAsinMiniToGames < ActiveRecord::Migration
  def change
    remove_column :games, :total_count
  end
end                        
