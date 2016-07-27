class RemoveTotalScoreToGames < ActiveRecord::Migration
  def change
    remove_column :games, :total_score
  end
end                        
