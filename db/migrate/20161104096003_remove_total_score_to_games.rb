class RemoveTotalScoreToGames < ActiveRecord::Migration
  def change
    add_column :games, :asin_mini, :text
  end
end                        
